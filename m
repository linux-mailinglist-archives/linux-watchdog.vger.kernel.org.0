Return-Path: <linux-watchdog+bounces-49-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3C7FEE60
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Nov 2023 12:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 054E2B20CA3
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Nov 2023 11:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862043D3AA;
	Thu, 30 Nov 2023 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="RxgD1U1V"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE761721
	for <linux-watchdog@vger.kernel.org>; Thu, 30 Nov 2023 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701345452; x=1701950252; i=wahrenst@gmx.net;
	bh=/C4rT09lyMFrxRi4GA6wRvI8mGinpee4/EGnSwHOt7I=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=RxgD1U1VSZNS1UwuIysUZLNjnW+Qu4uMEcxdDsq7QUxqfpZyDsxl67qtu4E3aARt
	 yThGyyR8n5SWr8+tbcVdHhB5uTHKYai+KmoGc/LKo1MkTVsIw0kCzvCENaeluXB3I
	 I5ZpcVFnnsNe8MpuIcKrc+MXoLfv4Wz6VzRo6Gr+lEFUrNtElkfDEn8s/o4lpezuB
	 g8RdiUik9tipeyrM7gF2IeHddQcw/4MnRshUQ8HX2nvhOPikJo7r3Ewp5javEGsRo
	 h0Qd+0p+PMomydxTVCVcrEoSs87xOan69Dyx4BrP2/2L+d8AyI3sQyMqpNUN6CUt0
	 zmIGGC9Mp6G/RjoINA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1qhcME2zdO-00UFeI; Thu, 30
 Nov 2023 12:57:32 +0100
Message-ID: <f0354dc4-e6f1-41c5-9a99-9847c96a15c2@gmx.net>
Date: Thu, 30 Nov 2023 12:57:31 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231112173251.4827-1-wahrenst@gmx.net>
 <cce852fd-618c-44f5-aa86-1cd33bd97351@roeck-us.net>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <cce852fd-618c-44f5-aa86-1cd33bd97351@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Qyyf5wWn/HU2CBr1RWinDJWx9HjhEQ50agsf1/5A2kK4NsNFSGC
 HivXlljcLHzQ4P1c02p/oPEnt1XLBzvckPj/NSb0A5LYnMBVVkcLEk0YsXcUP7PJ6DkEnuk
 zIWgvuglt/UE7hb8JdKMlLx2XDaxEEZcbVcfJgZF5srHUldAoOw1klWYPgJj94NYHfZLPwR
 ed1pZiLqvPzIUlxXbLHCA==
UI-OutboundReport: notjunk:1;M01:P0:MTpt/NARV8I=;sxiBNJWkixwTsFmdCxnMxBqQgHy
 DJR5uue6lkrCfQrqaHY4pE1yX57ui0/tUNITdSgF0knSQ7Bixfhq1gtNKTCkEZ3NIIWuncT0D
 K7L3yuML3ViDcLx+xoO1szK1AblXvhK5QySe7zTG4Jgaj536V6k5q+qLhmSaBx0WFm2ro286b
 gLsk7R63xA5oajuZCuc6ry2wwt3PrwaB67O3/XiC34SAywVIKYq5t3P9xpnnZ8nz+30vVJPbO
 lGBe1z0dPJMrdeV4bCR/1mDCMl7+OZrVUNUxkVSVR7oIhjOKeX8YrgBS4kH1DRjbovUEMyul6
 gfk/o2ZoO5N0Hqf59kTXLpO21raMyHZRFQXOiLTj7AwErSr8bGtXHrQ60FKh3dcAxR+wvhFrw
 a6v313kbbSWw/nO4OZdD61A7TPdStwdLUZC6w+FwcRznPFa0MFF4u0GRcFtwY4L4HEx3l2xo9
 BD6/F8+7BpfZGPvn6GDkxWcWE8cqoAw7tTG1O9a7U/1CrCtRglUjY1y5eufw9qN/oHCDpeUkH
 YPfAr5qgMCNR6STZwfiNxANgle3Jkt9+JYlWnL1ykz4hW7I0TDBKrBMWn49VOf3Q0h75zGy3n
 GRMBZMJK+1Ylum6pOwn0xSOHydM1ZC6tWIYXE2zcpjMzmSku/ymz311vATTndVrPPaP/H2J6s
 uKRtfIu3XvLnpHpAEPt73OMv43V4QMikaTdEZtQfP0w7rq5axtc3dXRvQ9+yoNJZsUlHp3nWY
 ElgYhmzub9W3lv09IX3oZU8j39adHZjVPld0Ix3lypKO9qQwu3d1PPaOtanUT1znQuAbidihe
 Nn9jElLV02eAE4ELlVL8reId5LpU9e8oEO8Hl9hXTwaQRPDEgCu8AJUIxMgwI45L5y7SeHKtE
 iZRZaR9ZukPGuj27a4bLxy3Sa9lUl318ftX/oNJYtF8vSS5XcBiMyBE2vpfyvwTLj6tHNmm6e
 YKy8zg==

Hi,

Am 13.11.23 um 15:31 schrieb Guenter Roeck:
> On Sun, Nov 12, 2023 at 06:32:51PM +0100, Stefan Wahren wrote:
>> Users report about the unexpected behavior for setting timeouts above
>> 15 sec on Raspberry Pi. According to watchdog-api.rst the ioctl
>> WDIOC_SETTIMEOUT shouldn't fail because of hardware limitations.
>> But looking at the code shows that max_timeout based on the
>> register value PM_WDOG_TIME_SET, which is the maximum.
>>
>> Since 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat
>> in watchdog core") the watchdog core is able to handle this problem.
>>
>> This fix has been tested with watchdog-test from selftests.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217374
>> Fixes: 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat in watchdog core")
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
who takes care of this patch?

