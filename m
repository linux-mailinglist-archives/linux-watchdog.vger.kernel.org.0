Return-Path: <linux-watchdog+bounces-360-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C58C981603A
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Dec 2023 16:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F41C01C20CEA
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Dec 2023 15:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6CC446B2;
	Sun, 17 Dec 2023 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="c65JLxqb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FE545BE4
	for <linux-watchdog@vger.kernel.org>; Sun, 17 Dec 2023 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 2C40740A42; Sun, 17 Dec 2023 16:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 2C40740A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1702827288;
	bh=f8FMduk32J5mDv1FWQOJ4O+W0eVJwGdxtVr779KbgCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c65JLxqbBryj5L5Cjk6qXkAeeqZjYi1ctWs52vEW93G7yXBnEqRDnH3fVRFjIlJZr
	 Rb7TYDjopF/iOVsxq85TLogiFR/KRPUjaCb+PyzNUCZLHdtfc8kKJO0f/fDfAMUS9Z
	 8X7405lWqJEazTU+m1WPu9Xd2dLgNgxC5KYd65eY=
Date: Sun, 17 Dec 2023 16:34:48 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
Message-ID: <20231217153448.GB6196@www.linux-watchdog.org>
References: <20231112173251.4827-1-wahrenst@gmx.net>
 <cce852fd-618c-44f5-aa86-1cd33bd97351@roeck-us.net>
 <f0354dc4-e6f1-41c5-9a99-9847c96a15c2@gmx.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0354dc4-e6f1-41c5-9a99-9847c96a15c2@gmx.net>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Stefan,

> Hi,
> 
> Am 13.11.23 um 15:31 schrieb Guenter Roeck:
> >On Sun, Nov 12, 2023 at 06:32:51PM +0100, Stefan Wahren wrote:
> >>Users report about the unexpected behavior for setting timeouts above
> >>15 sec on Raspberry Pi. According to watchdog-api.rst the ioctl
> >>WDIOC_SETTIMEOUT shouldn't fail because of hardware limitations.
> >>But looking at the code shows that max_timeout based on the
> >>register value PM_WDOG_TIME_SET, which is the maximum.
> >>
> >>Since 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat
> >>in watchdog core") the watchdog core is able to handle this problem.
> >>
> >>This fix has been tested with watchdog-test from selftests.
> >>
> >>Link: https://bugzilla.kernel.org/show_bug.cgi?id=217374
> >>Fixes: 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat in watchdog core")
> >>Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> who takes care of this patch?

I did.

Kind regards,
Wim.


