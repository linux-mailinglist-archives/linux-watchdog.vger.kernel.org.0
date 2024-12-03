Return-Path: <linux-watchdog+bounces-2496-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1859E1911
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 11:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86B9BB23BE7
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 09:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D2B190068;
	Tue,  3 Dec 2024 09:58:04 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BF165EEB
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Dec 2024 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219884; cv=none; b=E2PyNXg9DhXeGpGpcTZ6t7zH0LH1OwOcVAwN+rkQPRRHDF7G/u3Z1Kfed7NaEoAZK99wAkU2OabGJImpxw0V13jwwemFd6Bc7t8zlk9Sill0b63VpNHnYvXzobuQBm1fBG2A/DDlCWJqbbxSewfcGCVZBMLTXdl3Xe0juFhe3jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219884; c=relaxed/simple;
	bh=5R9V6VM88Pv7fB0kKpA2gIRwslcp4CmlIjVmF2/i4hU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UbzilMPdR28pzr8+TPEON8xCIX0tuEdZ6gfzqKsLIrbFCIOFLRTEIjrtlmNT4/IU9kAI2Ydwcy9MGD9k1Pa9jd1ramNOorRYmik6nWHV+C6mn27U20rrOIvxI5sWDST7vCotIXt6GMECsamAl2PpcjN23HN0rCy9s/fWlp0UXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by xavier.telenet-ops.be with cmsmtp
	id k9xz2D0093sLyzB019xzFx; Tue, 03 Dec 2024 10:57:59 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIPfL-000B88-A0;
	Tue, 03 Dec 2024 10:57:59 +0100
Date: Tue, 3 Dec 2024 10:57:59 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
    Guenter Roeck <linux@roeck-us.net>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
    linux-next@vger.kernel.org
Subject: Re: [PATCH] watchdog: Switch back to struct
 platform_driver::remove()
In-Reply-To: <20241010203622.839625-4-u.kleine-koenig@baylibre.com>
Message-ID: <6236624-1239-9671-7fab-7b1b84d5e778@linux-m68k.org>
References: <20241010203622.839625-4-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2132459464-1733219879=:42768"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2132459464-1733219879=:42768
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 10 Oct 2024, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/watchdog/ to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> While touching these files, make indention of the struct initializer
> consistent in several files.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Thanks for your patch, which is now commit 562b0b03193b567c ("watchdog:
Switch back to struct platform_driver::remove()") in watchdog/master.
Note that this now conflicts with commit e70140ba0d2b1a30 ("Get rid of
'remove_new' relic from platform driver struct") upstream.
Resolution: just take the version from upstream.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-2132459464-1733219879=:42768--

