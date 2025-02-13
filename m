Return-Path: <linux-watchdog+bounces-2928-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1690A3408F
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 14:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC6AC16723E
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 13:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8807F23A990;
	Thu, 13 Feb 2025 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a7KiYR8x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d/F0i+jH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C452227EB3;
	Thu, 13 Feb 2025 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739454199; cv=none; b=WWr+eIZRsyrW3ONDe3zBYufMfy+yHbpWR/AI1746kTF6wz83eYKGgF8m8l8+9mpimrcRLeorYQsKWsiqgu0WbkEWaVHbrWopcKLEHKzJyI5jOD5Lsoq0pDu+0ZqGQUJ97+nuZf5ZzytL/nxjzj4iCSs9vc4mUphQamzBttysKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739454199; c=relaxed/simple;
	bh=ebgNp+yu/75osAcSngnR77FHcIFvn/fYZhFpRyoSv44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/xyJ/7fbECga8AAXffZO3T6ScNLCZpxmYAVdQ1sDNRImY0Ir5dpe0qlZvxSot3wOJmC32drb99FkBONikYvyDrhCWlaUZu0Yrs8Q5XdPt1BIAGN8t4RToYxZauJhQFPnZVN3+bXqEyH4Js1sUc/StRSUTu/dA+H68A1heRdLTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a7KiYR8x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d/F0i+jH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 13 Feb 2025 14:43:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739454191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebgNp+yu/75osAcSngnR77FHcIFvn/fYZhFpRyoSv44=;
	b=a7KiYR8xBV8RPvJSblYbogU2++Ph2RS10v+xmFFkZQuiy9UyJH5LKakgSMdvEns2TK2jKF
	hD+zxyIcUjEc4TbRojYly/pWeF62EDiip7U8fG0YjeVaIhXLZSKU8OsNV7roDGjyFgV2w2
	GRBdwP+d8/9qUgsrZPvUaYZy4YO9/wsQ+Pv4bZTJB5G1RmZSm44jhZlvvh7yZJIeVFjKEx
	1ey5IDD7eAK5pzwilj6q6SzifANnIjR4d89YrH7mFEYpspsTmA0YjVjR2O9TMha61GXL0V
	xP2lCt9Lmv0QhgD1VgvvjtcHjiCNFm2E6E+gzMSq04vxIg6qsgcAYXFf7KFSow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739454191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebgNp+yu/75osAcSngnR77FHcIFvn/fYZhFpRyoSv44=;
	b=d/F0i+jH7duEjQXv3ZYotuG7OmGmwZCMcuA9byuWB6Sj5F0rtvPDorEt1Bthg4Zubsnh/c
	LXdicr2EzS7eFFAw==
From: Nam Cao <namcao@linutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 23/31] watchdog: Switch to use hrtimer_setup()
Message-ID: <20250213134306.4FjZjhmJ@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
 <a5c62f2b5e1ea1cf4d32f37bc2d21a8eeab2f875.1738746821.git.namcao@linutronix.de>
 <882031d8-5b8b-455c-9f5e-90090408304e@roeck-us.net>
 <874j0yksc8.ffs@tglx>
 <d94a8e53-41e4-40b9-aac4-0041ad5db9af@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d94a8e53-41e4-40b9-aac4-0041ad5db9af@roeck-us.net>

Hi Guenter,

On Thu, Feb 13, 2025 at 04:24:25AM -0800, Guenter Roeck wrote:
> I have no idea what changed since v1 or why. If you can see that
> in the patch description, good for you.

The change log is in the cover letter [1]. I just noticed that I forgot to Cc
the cover letter to the watchdog mailing list, sorry about that!

This v2 is sent due to conflict with 6.14-rc1. Most patches (including this
one) are the same.

Best regards,
Nam

[1] https://lore.kernel.org/lkml/cover.1738746821.git.namcao@linutronix.de/

