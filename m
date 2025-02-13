Return-Path: <linux-watchdog+bounces-2926-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BAA33D9C
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 12:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62FE01889F64
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 11:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D440C26A096;
	Thu, 13 Feb 2025 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JE83L+b8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vEgLvzwI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1E269D11;
	Thu, 13 Feb 2025 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739445386; cv=none; b=UZAdnoheMjdX3Pcl6nU3iMncIF6zuRnMjcQAWW4rzhWsvFq7nkPRwB1nf+um7hHAzvLhuNA6TTfKncWI9jC0+OVzQjFePtlsqfzdIdsRzgwvQPu07OuKJKHxlT8XkMEpID6I8L5pao/ozDop/a4LSFbF6KCB/7Xw9ltN9eWB3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739445386; c=relaxed/simple;
	bh=BMSO972QsJlkpq/ELQtBu+89YOvMmgIb59L89uEyU18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gXouJ3nXCgfdvmUHueh4xpl7vMe1slBLnZkvtFkBupr0EUdjFhUotzL75m9LZVOBJq8qvS5lQyEqokzBIoLWSQrOHhqk1u07E0DInivgq8QoCJUv0W82bueCKeEiOrfgoeD9p/rgGwKMZHT2qTMW4vHc3j7qvFFZp/RQQIBOBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JE83L+b8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vEgLvzwI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739445383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmsvQWWqCGOKaji09TQ4lAxxT0ozuSS3l1OlKUtsmS8=;
	b=JE83L+b8T99iAheuTc7ED5ReFR7Ocqw96uZTW+KGNZPoB8Rnl9HZU1X9WR0tkB3WZzHRj8
	FvBziRpHaHmjmCHguO8XDpqGOu7mQnw8R1yagHYVn3uthWCYHj0Eaza1RcJL5rFxshP1Ry
	pU/NR72E6D51L+v9112OUIgjb43BkamoZCJ1kt9fPe9AVaGEAUFdieZQAuVU4j4cxzDUJs
	QEq++moCRzrHDZJyLTjwLwMbbGlo1QGTOmtleuM3hb6EoyfYdcfqBu87kLop1OiU+Y4KEN
	UNQZp6XtImaUmSfModiNKDK0GFgCVaWi3OnR+kZZWz8Y7bxvMHsD+33/bum+6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739445383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmsvQWWqCGOKaji09TQ4lAxxT0ozuSS3l1OlKUtsmS8=;
	b=vEgLvzwI9eqOq8AlmymMLdsNKpR5Ux4gOl5B9XdjUXrf7Nr/rj3aFnB0ENmj0yzDRWU/CJ
	s1nOPh2iwxvCAWDA==
To: Guenter Roeck <linux@roeck-us.net>, Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, linux-kernel@vger.kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 23/31] watchdog: Switch to use hrtimer_setup()
In-Reply-To: <882031d8-5b8b-455c-9f5e-90090408304e@roeck-us.net>
References: <cover.1738746821.git.namcao@linutronix.de>
 <a5c62f2b5e1ea1cf4d32f37bc2d21a8eeab2f875.1738746821.git.namcao@linutronix.de>
 <882031d8-5b8b-455c-9f5e-90090408304e@roeck-us.net>
Date: Thu, 13 Feb 2025 12:16:23 +0100
Message-ID: <874j0yksc8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 11 2025 at 08:16, Guenter Roeck wrote:
> On Wed, Feb 05, 2025 at 11:39:07AM +0100, Nam Cao wrote:
>> hrtimer_setup() takes the callback function pointer as argument and
>> initializes the timer completely.
>> 
>> Replace hrtimer_init() and the open coded initialization of
>> hrtimer::function with the new setup mechanism.
>> 
>> Patch was created by using Coccinelle.
>> 
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: linux-watchdog@vger.kernel.org
>> ---
>
> Change log missing.

I read the above as a change log, but _I_ might be missing something.

> I am also personally not a friend of changing
> multiple drivers in a single patch for changes like this. That makes
> it all but impossible to revert one of the driver changes if it was
> wrong without reverting everything.

Come on. This is a purely mechanical change which is fully equivalent,
so splitting it up further is just increasing patch count for no value.

Thanks,

        tglx

