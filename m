Return-Path: <linux-watchdog+bounces-4596-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E2C61935
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 18:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD12F359499
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 17:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2924A30EF67;
	Sun, 16 Nov 2025 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="nlEdJHbH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5386A30EF64
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763313293; cv=none; b=RmFeM7g7rrT7u7j8fgpKDTYmO5ezROHuw0htKV19EKq36CqKmAs7zGUm8OaCsRmPETCbrXITUVjg3BykAnfyiS2sc6AAUD3JU8FPTVufVazxF7uyMhqiGFD9p3Hxmyze+BuSmawtb27muHd2kVgUFueguqAVVqyffUlJAcHdwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763313293; c=relaxed/simple;
	bh=iU4kg3fTthx31CLEvOgHZrLQ7eiCYB+S44op6tDlefU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kqYpsUWcpwvFMaDharVbgYTKWtmW1DS354RVkVOANpulPDg2YuZartS8/PrZ3RV8zZozPctXHU2lAu5mRs2tQp31fZcxNvaIMzM84eXZV9dyzAA4NqbnQ93S6VR9tk2fO5y1fn3Jw6nrlYpedtfAyhwO88NJ14x38GVkhQ1mkjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=nlEdJHbH; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/M0HBZ2QMDz1vx4pJxYjKWAxBA1hFivPJ6FGsFSTXPg=; b=nlEdJHbH9lbM/PlQWLG1n6gpj3
	jhu9C1njn8SXF9svwpHaUvZ3b5PzTZSbpZS9eKvveZ+pWNO5L3PCTRGaae/8FOnXTtZV88JZMyJpL
	alx1mTyDb3s+7I56CfEw8lguzWs12OSDkMu5anR2gsC6E7TBHlM53+ziNbqtf04Ykg8lzPvEt9cn1
	x/uLmH84JpVLVQwKjY39DWCyLk6XXZBfe4Anetz+Xqtb1dPLoFNGHdMUKKlkcQCzBdjQaPF6O8m6f
	goFp8lO1zZaui0GWMTjYyV0LH1OkurRwJClN64An+alqWtheehUrWMcAf91Y0T5TJmrqEA4d5pZ+W
	8bv7amkw==;
Date: Sun, 16 Nov 2025 18:14:54 +0100 (CET)
Message-Id: <20251116.181454.1861060123559061936.rene@exactco.de>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] fix it87_wdt early reboot w/ FW started timer
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
References: <20251116.145908.308086523429052446.rene@exactcode.com>
	<72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

On Sun, 16 Nov 2025 08:22:39 -0800,
Guenter Roeck <linux@roeck-us.net> wrote:

> On 11/16/25 05:59, René Rebe wrote:
> > Some products, such as the Ugreen dxp4800 plus NAS, ship with the it87
> > wdt enabled by the firmware and a broken BIOS option that does not
> > allow to change the defautl time or turn it off. This makes installing
> 
> default. Also, claiming that the BIOS would be broken is

Sorry for the typo, English is not my native language. I will try
harder next time.

> inappropriate:
> For all we know this is on purpose.

The BIOS is broken in that it has an option configure the time and
disable it but it does not save and thus have no effect. Thus that
part is as broken as I described it, ...

> Unless I am missing something, this makes it impossible to stop the
> watchdog.
> Is there a configuration bit indicating that the timer can not be
> updated ?

No, I only meant the BIOS configuration is broken.

> If so, the watchdog core needs to be told that the watchdog can not be
> stopped.
> Otherwise userspace could try to stop the watchdog and the system
> would reset.

No it is fine, setting the time to 0 disabled it, I tested.

> > Linux difficult and annoyingly rebooting early in an installer; unless
> > one loads and starts a watchdogd in the installer environment.
> > Change it87_wdt to report a running timer to the watchdog core using
> > the user supplied or module's default time and set it as the timer
> > might already be up and trigger soon.
> > Signed-off-by: René Rebe <rene@exactco.de>
> > 
> 
> ---
> and change log goes here.

sorry, oversight, I'll make a mental note to never forget it again Sir.

> > --- a/drivers/watchdog/it87_wdt.c	2025-09-28 23:39:22.000000000 +0200
> > +++ b/drivers/watchdog/it87_wdt.c 2025-11-16 14:18:24.759115286 +0100
> > @@ -4,6 +4,7 @@
> >    *	   for ITE IT87xx Environment Control - Low Pin Count Input / Output
> >    *
> >    *	(c) Copyright 2007  Oliver Schuster <olivers137@aol.com>
> > + *	(c) Copyright 2025  René Rebe <rene@exactco.de>
> 
> For a couple of lines of code ? Really ? I changed 75 lines in that
> driver
> and don't claim that.

To be fair, for my inital one-liner fixed I did not have that, but as
I now spent hours adjusting it to your suggestions, if not
requirements, debugging and testing, I thought that is more than a one
liner. But my life does not depend on it though legally it probably
might be a thing.

> >    *
> >    *	Based on softdog.c	by Alan Cox,
> >    *		 83977f_wdt.c	by Jose Goncalves,
> > @@ -188,6 +189,15 @@
> >   		superio_outb(t >> 8, WDTVALMSB);
> >   }
> >   +/* Internal function, should be called after superio_select(GPIO) */
> > +static unsigned int _wdt_get_timeout(void)
> > +{
> > +	unsigned int ret = superio_inb(WDTVALLSB);
> 
> Empty line after variable declarations.

Oh  man, guess  time to  re-read the  kernel style  guide and  run all
changes thru some verifier ;-)

> > +	if (max_units > 255)
> > +		ret |= superio_inb(WDTVALMSB) << 8;
> 
> There is a configuration bit which determines if the timeout is
> counted
> in minutes or in seconds. That needs to be taken into account as well.

I had this at the caller but can of course move it here.

> > +	return ret;
> > +}
> > +
> >   static int wdt_update_timeout(unsigned int t)
> >   {
> >   	int ret;
> > @@ -292,6 +302,7 @@
> >   	u8 ctrl;
> >   	int quirks = 0;
> >   	int rc;
> > +	unsigned int _timeout;
> >     	rc = superio_enter();
> >   	if (rc)
> > @@ -374,8 +385,6 @@
> >   		}
> >   	}
> >   -	superio_exit();
> > -
> >   	if (timeout < 1 || timeout > max_units * 60) {
> >   		timeout = DEFAULT_TIMEOUT;
> >   		pr_warn("Timeout value out of range, use default %d sec\n",
> > @@ -388,6 +397,17 @@
> >   	wdt_dev.timeout = timeout;
> >   	wdt_dev.max_timeout = max_units * 60;
> >   +	/* wdt already left running by fw bios? */
> > +	_timeout = _wdt_get_timeout();
> > +	if (_timeout) {
> > +		pr_warn("Left running by firmware.\n");
> 
> This is not a reason for a log message, much less for a warning.

I often daily waste time with something random, because of missing
diagnostics. Often something as stupid as this. Should the user not
know the FW left a watchdog running that you insisted should be left
running? I certainly would like to know that there is something I did
not explicity asked for especially if a user might wonder why the
system might sometimes randomly reboot. Few will see this message.

The kernel has much more random nonsene diagnstic, like MCE missing on
on Intel and AMD CPUs etc.

> > +		wdt_dev.max_hw_heartbeat_ms = timeout * 1000;
> 
> This should be set instead of setting max_timeout.

I thought that might not yet work here that early, and IIRC grep found
other drivers doing it liek this, but will of course adapt.

> > +		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
> > +		_wdt_update_timeout(timeout);
> 
> The watchdog core does that already when the watchdog is registered.

Ok, instantly without delay? Will double check.

Thank you for your review, will send v3 soon.

      René

> > +	}
> > +
> > +	superio_exit();
> > +
> >   	watchdog_stop_on_reboot(&wdt_dev);
> >   	rc = watchdog_register_device(&wdt_dev);
> >   	if (rc)
> > 
> 

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de

