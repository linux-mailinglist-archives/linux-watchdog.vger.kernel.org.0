Return-Path: <linux-watchdog+bounces-3054-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE82A4FD13
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 12:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3D23165573
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 11:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44D4233708;
	Wed,  5 Mar 2025 11:03:03 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32121230BFA
	for <linux-watchdog@vger.kernel.org>; Wed,  5 Mar 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172583; cv=none; b=bFd585C3o7hlyVkkgxHiaZZ5HEDHuF5PcYmqFrJeTHkqU7Fkb9s1MCABM7snuJFtuR5Jpk+O1TmHlAnci7QFTjMXsMycgiQBgmBftU0o7ZhUbnk5bQQeRncoPZ5LTqQAQ14eTMY4E0Lt6GuY8cyPvfYQkA/BfwHZTE0iB4MBrqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172583; c=relaxed/simple;
	bh=JAUm4+VWC+SmkWP2S8QleEY91rM70SFeEbmpI/d5+Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+hfLBgq4YHA00WYD3tGYPOHGMeO+8xmpkNVU3M1jEq7ktqDv+z+cm5u6Vun/5uMeJsccFP9vdsXZ6AL198aWMKjB4zLkkcp7N3ZRpREk2YxjsQbNjFu53fa53rMNs8wKc9y2yEqwcMbf8OUOfwumbnbygFTd/kJYac65sB/nZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpmVq-0008LI-3s; Wed, 05 Mar 2025 12:02:06 +0100
Message-ID: <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
Date: Wed, 5 Mar 2025 12:01:53 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <gcherian@marvell.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "jwerner@chromium.org" <jwerner@chromium.org>,
 "evanbenn@chromium.org" <evanbenn@chromium.org>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
 "lma@chromium.org" <lma@chromium.org>,
 "bleung@chromium.org" <bleung@chromium.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "andy@kernel.org"
 <andy@kernel.org>, "paul@crapouillou.net" <paul@crapouillou.net>,
 "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>,
 "andreas.werner@men.de" <andreas.werner@men.de>,
 "daniel@thingy.jp" <daniel@thingy.jp>,
 "romain.perier@gmail.com" <romain.perier@gmail.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "yuenn@google.com" <yuenn@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "naveen@kernel.org" <naveen@kernel.org>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>,
 "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org

Hi George,
Hi Guenter,

On 05.03.25 11:34, George Cherian wrote:
>> why is armada_37xx_wdt also here?
>> The stop function in that driver may not sleep.
> Marek,
> 
> Thanks for reviewing.
> Since the stop function has a regmap_write(), I thought it might sleep.
> Now that you pointed it out, I assume that it is an MMIO based regmap being used for armada.
> I will update the same in the next version

Failure to add WDIOF_STOP_MAYSLEEP when it's needed can lead to
kernel hanging. Failure to add an alternative WDIOF_STOP_ATOMIC
would lead to the kernel option being a no-op.

I think a no-op stop_on_panic (or reset_on_panic) is a saner default.

Cheers,
Ahmad

> 
>>
>> Marek
> 
> -George


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

