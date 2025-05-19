Return-Path: <linux-watchdog+bounces-3525-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD6EABBC8C
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 13:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C7287AF562
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 11:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31578277021;
	Mon, 19 May 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWxwDhC2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C074275115;
	Mon, 19 May 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654517; cv=none; b=XP4aKBSTg04NK5e47usdIsI9GtVnUjKc0Ovqtqf4jMcYVhk3dH+pOrts7Kapr4DyQNEUdyqTdOTJ705yOMHd7XbbaWoSykqJiCrC+bcXtKAzqm7i4gJ2iZ1FzMTUJ2WIaAsJw5jmoyS3kQch2NljIcBGfJyJ2bg/V/+oU3Qv8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654517; c=relaxed/simple;
	bh=TOTn8GFmhX74x/VZ2DHWF88Fswebwu1oTEvmpmvzOAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaxIsZ8mxfKoyqWiizyBiu+QZqOoO0qHenAV+Kf6yZKoFSOG/jX9Dlie07/fNLZWUvEdfUZW5aAG0G8fvmy3toUsOprw9xFSOlmqoVouW4+q+TP35MIYDSayesAwxYk96Jj7PCNYdfJGvAygR1bUfZbS+0aq0juT+ib9KKF9t40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWxwDhC2; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476ae781d21so43456921cf.3;
        Mon, 19 May 2025 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747654514; x=1748259314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvMGf5g2weozdIFZo63Xax4wmIQw1PPebi0s+41OCrs=;
        b=lWxwDhC204VijYY/wvQtFkSoQ6NkKMP88L6rUz9cYBugm4qUg/L1+RqquX1FHgNiUE
         T6dBa1oUFvq7wRNjfStHZJNUvkSuKbEeOhBUc0l1VJ4wmwKRiw9pgUXeYh2SlxEfztKF
         Pg42p1FRUuLP7VinvmTe8/uIty4p3Wt/270i1uLdeRIMULduK+YObCoj5sxcM5ps1tRn
         avev0UjvQnpP9NzEIeSV4+si+h/CLz/6y+PqwC5ysSwpeJkIwPLmuaq2HrUmhtsn06hz
         wTkVcqavOu4+jXl2gEKgwiIXSz+c/JLngwQ994RHA0DaWbHBv8WXHU2HB7DZQFdvmOY/
         Ar9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654514; x=1748259314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvMGf5g2weozdIFZo63Xax4wmIQw1PPebi0s+41OCrs=;
        b=TrMmqb+oenfY+8yZAAq14ssCtvt5xssRw4AyI/7CnHEHGPRN1znBI4VYp0ZRAsB4cd
         ldR1UALa4c9PPScXloY+xv2+Nb78RRYQXB42yJSzmDQDARc890D5gbvrVyLE0mndyFHs
         MlrngkKoEKnaWHMrYQlvEDzAsLtPmLZKJng6LF2yLe5eK9lxjyTNWt5AC4HMiCATn38i
         nLHo+FM6X7fOMg4t1rtNqOQd3OOshQt7U6QZVFWgbZkzVI3SLRzWS6xtm8SjOnEzTNFn
         XyCxubE8SoLsbj/0fPcwfvhWIKiQlTwMLyBto8q89/Zv2LX4T1W2qW8hLfgiM/jUkjtL
         FIsg==
X-Forwarded-Encrypted: i=1; AJvYcCUICz7bz6NeYGkH/YJiaKtW4EPRuzdAuQKz2pQyyZL+dRcY8r7Jn4wPSg7YUxZVvv61kypW2BF8y6teGe1D@vger.kernel.org, AJvYcCWVNOYEVctcX5uKtU+TDOkSpf5JlD2bcBU/9LUGbBobdNrjXb542AAx6F8IzCuVYG6J+TgLXILpP96r7LXkz54=@vger.kernel.org, AJvYcCXWwVFqEvsoWGC9QLy8eTIfxOy/h05Spqd8j92H6cN13wn4x1QOjaMh+hOXQ74I6lPvryWi2vBUJu5T@vger.kernel.org
X-Gm-Message-State: AOJu0YzJH3zp2HtZxljyEgDuJfwU5Y6B3eYBfP915eFuaRARa1scWS8y
	kZ19C16DOf3FTUBwydgChKNnekgV598GGLod4IeF3LVawh+UhnvpleHKLIk94XMsXTB+/ny3+fT
	hxBbWp6aMUJ5+OwYn7Qz3yabyPm2rCVs9krAT
X-Gm-Gg: ASbGncswhSzKPxgyeKfxUwMnPYlwKlWqx2RpYvJDzQ+J889avDJjuA7Y/2q+gw1c+St
	qiSdMcTAaVRQNVyWTtZRKRuZnC1Iei/mgOend+81GL9Hc+bK5X6eFEta6WFMvjgDIMU29yoZKVn
	cBmFnpP3iE8daKF6xJBB/cNYCZFH5ZklFeLKW9445y/0UeK06tsyo56np8vhyEr30=
X-Google-Smtp-Source: AGHT+IG8voR8X2h42Gvzm1hYVSaBNVOszaGXju3Wj3QHsFtLKDEveorvqw8YGPS+So3ZB6nWZgvBoo5R7KUB95DaVlk=
X-Received: by 2002:a05:622a:59c3:b0:476:9474:9b73 with SMTP id
 d75a77b69052e-494b0939a78mr192684461cf.42.1747654503905; Mon, 19 May 2025
 04:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com> <202505180911.hDevFA1N-lkp@intel.com>
In-Reply-To: <202505180911.hDevFA1N-lkp@intel.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 19 May 2025 15:34:59 +0400
X-Gm-Features: AX0GCFuiDlrcWsgaEaNmFJ8EIQjE8OcrTnIsT4xwkYdG39zHB1uMjrH0T6Jryxc
Message-ID: <CABjd4YwJgZiq9_jKGa70GaxaW8TT=JuwDioU6jH=J_O=t+QT8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: kernel test robot <lkp@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 5:24=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3=
-3-2197a1b062bd%40gmail.com
> patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare f=
or watchdog functionality
> config: loongarch-randconfig-r123-20250517 (https://download.01.org/0day-=
ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180911=
.hDevFA1N-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected void *platform=
_data @@     got void [noderef] __iomem *static [assigned] [toplevel] regba=
se @@
>    drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected void *=
platform_data
>    drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [noder=
ef] __iomem *static [assigned] [toplevel] regbase
>
> vim +201 drivers/clocksource/timer-vt8500.c
>
>    175
>    176  /*
>    177   * This probe gets called after the timer is already up and runni=
ng. This will create
>    178   * the watchdog device as a child since the registers are shared.
>    179   */
>    180  static int vt8500_timer_probe(struct platform_device *pdev)
>    181  {
>    182          struct platform_device *vt8500_watchdog_device;
>    183          struct device *dev =3D &pdev->dev;
>    184          int ret;
>    185
>    186          if (!sys_timer_ch) {
>    187                  dev_info(dev, "Not enabling watchdog: only one ir=
q was given");
>    188                  return 0;
>    189          }
>    190
>    191          if (!regbase)
>    192                  return dev_err_probe(dev, -ENOMEM,
>    193                          "Timer not initialized, cannot create wat=
chdog");
>    194
>    195          vt8500_watchdog_device =3D platform_device_alloc("vt8500-=
wdt", -1);
>    196          if (!vt8500_watchdog_device)
>    197                  return dev_err_probe(dev, -ENOMEM,
>    198                          "Failed to allocate vt8500-wdt");
>    199
>    200          /* Pass the base address as platform data and nothing els=
e */
>  > 201          vt8500_watchdog_device->dev.platform_data =3D regbase;

Frankly, given that this driver only applies to VT8500 (which is ARM
based), the warning appears a bit overzealous. After all, on ARM MMIO
addresses are in the same physical address space as normal memory
addresses, and furthermore this platform_data is never dereferenced
directly anyway.

I could silence the warning either by more aggressive casting or by
wrapping the pointer into some struct, but both of those sound a bit
overreaching. Would appreciate guidance from the list on how to best
approach this.

Best regards,
Alexey

