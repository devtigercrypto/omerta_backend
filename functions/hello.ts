import { Request, Response } from 'express';

export default async (req: Request, res: Response) => {
  const hello = req.body; 
  res.status(200).json({ hello:  req.body.hello });
};
