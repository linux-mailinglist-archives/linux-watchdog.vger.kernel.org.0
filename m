Return-Path: <linux-watchdog+bounces-2329-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB919B0A3C
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2024 18:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8DF2854A6
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2024 16:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFB2320B;
	Fri, 25 Oct 2024 16:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+RhSiz6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01D1885A0
	for <linux-watchdog@vger.kernel.org>; Fri, 25 Oct 2024 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874877; cv=none; b=WlzFKVe2NbRfPtBPvFiARUHiX6m1ijQXRTvWc4c5ofEKC6Eeb51IXKsk8zrrDaOWNoJEl6XdDRhFjXnIc86iYEqGw8nyE0bWIPhZBhRkDS5oiz0F5N+wyvbAHAnrZ3WSunfSzKrg+EJTuXEKnPo75lYzOIq2lo0O7BAsUDV/D/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874877; c=relaxed/simple;
	bh=CObiHbi4jPloahOTX9vchq2ji+ft7iwH/VOmwjuwycU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KHU1hcgd1Kl9X/iLr/GN9vl6FJBTxHzq3Lodrwa/8cm24K4WAuJEr3Nn19SlKXeQaFttxjSs+XwnUOeT1n4jfoIzuqy3+jXHQoexmDcuX52QZ7j6pQRYPvqQRsZ/EWAo7pFq1wzU1uOCocxAiqJp1biFdNtiC5+0uilMHJiiXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+RhSiz6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso22682865e9.0
        for <linux-watchdog@vger.kernel.org>; Fri, 25 Oct 2024 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729874873; x=1730479673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pq8Pls6wfcoOIkkesonALKXUkplX5+7I7+nTvhjnX+Y=;
        b=B+RhSiz6rLDUeFQgQXnM34HAsfMAlA/z4PBkcGgbjYNfFoZgCPWaqXP+eRx1t/KQDj
         U7KiBRw/GNElnYa7tXGyE/LAK7t6nR9Jjv8qysnSqXON8A25uFIG3izq9eZyf28jAG1b
         mY24CdUQCKjUrwe29SycsmgZyfmE+wevzso87lRMKyGMNWRAMCL5/DGtZpeaWXkpfCzg
         tB0CCO5Ak93cH1WxdMcf5rF1CJJAcIZG3x3MZJkL/hVM9maSpxrEGDyRICDffHluZuU3
         39tQ3z6+bY/9HENcsp1ttD6lSmKetIjBG7IKx8iuYOsnjJ7u8GFPhxrLgWjY19Umb/I3
         xzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874873; x=1730479673;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq8Pls6wfcoOIkkesonALKXUkplX5+7I7+nTvhjnX+Y=;
        b=djFeAzkrQPQdBW+WjH4uZWf49vY9vp3xP0aMK3D9N89Pqo8CVAFttWZBhK+nS11wOU
         kNbwY+rueLvKSqJaoe6b/Sk3hYBBlC0wu93y9KZlAR/+OQWlPg2zifdikXxZtSSbwWGN
         bHVCzxszl6wNat48CABJj/j3d0Q8/3OSVtl8mVsuFILD0O4mk1wtJuCw8COE/kuJyMeU
         9z2Ha5+vDmFsVk9zI3CB+WbWCfLSwTqnrIMe/2MGJAIFOhCFtydsAiTvRZR2Tmgdn5jm
         l3ph2WMJ9l5A9XRFZ+K+cCtVULLC9GzvVEZhTHSfrdN7u+wkf4l6DBqRUfPhLB9FrNkW
         jofQ==
X-Forwarded-Encrypted: i=1; AJvYcCXni7c4pjbwOdMMhrzwXmvHm24QDoSruU1de/bCAhfpGMqyWFldvmxmhOnx0pq6UWueX6rqIr8NOnYhd7T5Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1zRHnYksDG/4lKF6fCX7YQ1UPKKfqxOOw1Vt1pF8WolMS7c3
	d7ebzvdn3Bv7QHpD3MWVS4Wue7pKohzDxNO29EbaxdEWRZll9mfXSU3p/KctEFs=
X-Google-Smtp-Source: AGHT+IF02bj5hqk2pa2px5XKt3k6T5GNE8a/QRIUqmwQLRKjQmn5vBqDV0jEbdaIf8k7NaYO4RlifQ==
X-Received: by 2002:adf:facd:0:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-380611dc14bmr38014f8f.42.1729874873628;
        Fri, 25 Oct 2024 09:47:53 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b4a3cesm1949511f8f.63.2024.10.25.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:47:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
Subject: Re: (subset) [PATCH v2 0/5] dt-bindings: mfd: convert
 zii,rave-sp.txt and child txt to yaml format
Message-Id: <172987487249.288365.3434469015929868507.b4-ty@linaro.org>
Date: Fri, 25 Oct 2024 17:47:52 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 10 Oct 2024 11:42:37 -0400, Frank Li wrote:
> Fixed below warnings:
> 
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> 
> [...]

Applied, thanks!

[3/5] dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
      commit: 17d6f058403d4e3458ec9c7dae607c065cabe089

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


