Return-Path: <linux-watchdog+bounces-3526-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F1ABBF49
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 15:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 264C57A6574
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 13:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2236127A113;
	Mon, 19 May 2025 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NldOBOOB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1DF27A104;
	Mon, 19 May 2025 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661688; cv=none; b=qX1pl4EOfY8RFQkBelMwHTIxAl4PZtL9F6tjaiBLuyVkhPvqg3VbyN5AxuUu1EzWwOOh8GW3oDQHAwUTlleq4sRW76Sz2zFaSsV5JSehI/XOfPbd7bqgo9ChgVpPZQT5UHLKj8K9SfdXms2UDgpVyaagweFxZREGs+6oqoMM2Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661688; c=relaxed/simple;
	bh=JkXYknsH9G+IMhmWbFMsgkLG6DOpL4QOe9VrCDJdFAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9BuLXh5wIoCeF/1C9xv0yaZLQw4jzdgXlnyTHW2+ZGPsALEw258yv2OVIse1JJp4Yo/bcU1o5ltcoLnJwUjIO/CIDTIkqQWC6MCtlAATeT53xHdEZtd/1iYJqno0Dq0zdzlKv/hcd0W465YVSXopxHIR89HEetKaDdrYaLm3b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NldOBOOB; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so3538702a91.3;
        Mon, 19 May 2025 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747661685; x=1748266485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FvE4A2cw590agEzQovwE0tUSTFl/A03UnoB9ran5osw=;
        b=NldOBOOBMXqsw4c443hsrk5EIUhhrY5arYiI9GZDnjFnlE/ow4I6l6Ol4RYq5PO8T1
         qjBZhG4ztX5MoVhCdbo2GoOrGgnkamFLjZ2ihjaCCvQWNDpRKnb7GQ2P+VFmWxmbqyR/
         mAYMVAjLmbovITAZJLEfDKcTX3RBW526tfgiv1+6Xkx/5xq5sTR3XRoO3HGy230OJL/E
         3nw6KHJUhNKoIPwITzzjo/fXF3/2w/RB7vjim5lnKxjNuY0k6V8Qncg8y5sPi4DGZveD
         uWBFjNCpLEedfubWYvtGg9cFZZKUwPrKPprzAC2vSMf+4Db09Pf6MXuVNBYbzutk6BGy
         DwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661685; x=1748266485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvE4A2cw590agEzQovwE0tUSTFl/A03UnoB9ran5osw=;
        b=clwRfiZEj7PACIEq/tpcsu4jnSQ3iA2KwwxfM6AmYhzi242koCBVammC0V8o2UlA8j
         lSE7nIfxiIDPPR6aX1OdIOlxWU16qM65kBhjPsq4H5gMR5bqsUW+vB7wHYJ+CS+HfKmp
         qSEjyE6CdpiL4ZNFYwSWtf6ec9dN/ikmZVc2QjGOWrcdoA7Mf5xhmRBfHrKhObvxZoSI
         g0+svo1DXBzPqKwDU4gY6eSBJt0uuGnO5akyxpPgzFEhGDYrJJYshPaL8UbCrO6k+tTV
         q/9cDKCMM2L/h/Z6PXUNXygXlHeozjOVQU12S/jiGfpMyX2RX0HsWphbkvtWFfi8v2YE
         /C1w==
X-Forwarded-Encrypted: i=1; AJvYcCUD/w0WonrFf2cRuak4eyQWw6WgJvd/WnFLO46Vanls133AFB0uR3NHIFtpYPqTs6rHyeXeWU6I7ZV/EaS3JfM=@vger.kernel.org, AJvYcCVreMTkTgBDePVB9rB4TWCQLTyUz3FMiHRU5YeAlqLLQ48TG8+JQVJ1wqQ20I2ph0U4s5bpuD75eGxFGMDh@vger.kernel.org, AJvYcCXpHGApsaE4H8JeA7wausSWb+eSYDICKbPi923QoOowBjQoP2jxzq6kNGt2urQf248jB/95xj5OcF+w@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqCp4i9Jq/5J19rlIDvmvF6LYOVHKvY5RHN7fHyYRuR0mTE+T
	IFdnZ1GZYClsms8PcXfhoV0o9WSpwvcnqJoHaAYpLabKqauqlTuqARhPneAT8JeK
X-Gm-Gg: ASbGncuv3QgwgHUd3P+Wn+RbQI5q1RhC81mvQqM+jtnJFbM7S1R2S8LfIeEe91HnfaD
	WV2ZMuLrmqPyOT/DxSyY8oub5byqdeMgIuNqqx6IcVuLWhMB5hI1sY/VK0kNQKGnr104abnViGj
	Q/k5qzq3XJO4zMTEVesX362zB3DrEP6/2VfeW2mPbtoH4bJyBMnAFrBH2TtC6yvknfmP3fJpfT5
	9x0GPmh4oykyjCvbcXu8g1b7Ts8OTw4odqkZiRnyvNa9zUylAk4Si9VIpVa9F4RB560kd+0Nh4B
	nt7S8W/SOG//pwUlSN4R5rqk5r9oHXVrZNHNZyC2gREMOMvRgXi41UQanaiJKfWdea1yKq/VO4/
	bUlj6oiKITKdE6uJygyEMZY7wB0xElZVhXh0=
X-Google-Smtp-Source: AGHT+IG/tHQ1B/seZBFpCh/ROov9eDFFT+Qef5knQYJHpO/bLkQu97BUCidxFZOhNI+ebAl6FAZC9w==
X-Received: by 2002:a17:90b:2f08:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-30e7d52b830mr17674248a91.13.1747661685226;
        Mon, 19 May 2025 06:34:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7558836a91.11.2025.05.19.06.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:34:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f74dbbcb-1628-4280-92e8-d89823a3a318@roeck-us.net>
Date: Mon, 19 May 2025 06:34:43 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: Alexey Charkov <alchark@gmail.com>, kernel test robot <lkp@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
 <202505180911.hDevFA1N-lkp@intel.com>
 <CABjd4YwJgZiq9_jKGa70GaxaW8TT=JuwDioU6jH=J_O=t+QT8w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CABjd4YwJgZiq9_jKGa70GaxaW8TT=JuwDioU6jH=J_O=t+QT8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/19/25 04:34, Alexey Charkov wrote:
> On Sun, May 18, 2025 at 5:24 AM kernel test robot <lkp@intel.com> wrote:
>>
>> Hi Alexey,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
>> base:   92a09c47464d040866cf2b4cd052bc60555185fb
>> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-3-2197a1b062bd%40gmail.com
>> patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
>> config: loongarch-randconfig-r123-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
>> compiler: loongarch64-linux-gcc (GCC) 14.2.0
>> reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *platform_data @@     got void [noderef] __iomem *static [assigned] [toplevel] regbase @@
>>     drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected void *platform_data
>>     drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [noderef] __iomem *static [assigned] [toplevel] regbase
>>
>> vim +201 drivers/clocksource/timer-vt8500.c
>>
>>     175
>>     176  /*
>>     177   * This probe gets called after the timer is already up and running. This will create
>>     178   * the watchdog device as a child since the registers are shared.
>>     179   */
>>     180  static int vt8500_timer_probe(struct platform_device *pdev)
>>     181  {
>>     182          struct platform_device *vt8500_watchdog_device;
>>     183          struct device *dev = &pdev->dev;
>>     184          int ret;
>>     185
>>     186          if (!sys_timer_ch) {
>>     187                  dev_info(dev, "Not enabling watchdog: only one irq was given");
>>     188                  return 0;
>>     189          }
>>     190
>>     191          if (!regbase)
>>     192                  return dev_err_probe(dev, -ENOMEM,
>>     193                          "Timer not initialized, cannot create watchdog");
>>     194
>>     195          vt8500_watchdog_device = platform_device_alloc("vt8500-wdt", -1);
>>     196          if (!vt8500_watchdog_device)
>>     197                  return dev_err_probe(dev, -ENOMEM,
>>     198                          "Failed to allocate vt8500-wdt");
>>     199
>>     200          /* Pass the base address as platform data and nothing else */
>>   > 201          vt8500_watchdog_device->dev.platform_data = regbase;
> 
> Frankly, given that this driver only applies to VT8500 (which is ARM
> based), the warning appears a bit overzealous. After all, on ARM MMIO
> addresses are in the same physical address space as normal memory
> addresses, and furthermore this platform_data is never dereferenced
> directly anyway.

Guess we'll need AI compilers in the future to help them know that.
I for my part would argue that "this warning can be ignored" is the
source of many problems flying under the radar.

> 
> I could silence the warning either by more aggressive casting or by
> wrapping the pointer into some struct, but both of those sound a bit
> overreaching. Would appreciate guidance from the list on how to best
> approach this.
> 

First of all, I am quite sure that using platform drivers for this is the
wrong approach to start with. This seems to be a perfect candidate for
an auxiliary driver.

Second, I do consider passing an iomem pointer as platform data to be
inherently unsafe. I would very much prefer either passing a regmap
pointer or, if that doesn't work, a data structure.

Guenter


