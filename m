Return-Path: <linux-watchdog+bounces-3766-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45745AEDF2B
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 15:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02AF23AD609
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 13:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEEE28983D;
	Mon, 30 Jun 2025 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6pCgFnN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98355213E6D;
	Mon, 30 Jun 2025 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290184; cv=none; b=Xc/afp6zIEExI+vf62ZgeRnVfLBVWbPMp5IJjobilR2lHZE1vfss0Jqkk8Tl0mrrOlJ+HZDR8WGVaIe6sJ7uo+2BGoSOqvx49aB2gqeVRwxO5pXIxR6PQ2cv+ycmpzu3ZYaGeHtA1eIBa+JcpOUeqtU2MUX8ilqJzj9BNZBNeLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290184; c=relaxed/simple;
	bh=tMGRzd3bK/I95D1NqkLcHSqiaWOSRKYJS++gRdKmVhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpXoJ4RVs1+05BHs2KZEFccIVMmke/Xcy9yxCSHZi9HPwqmo7Zb33sHID9Aa2Wo6057hA8Vhi0muoCpQT0Ku/EWC+z2/MY1IALh+CqJkR3M5LDOKCf/6T1AnTZshDl+eVvqKbAHDUGAHP36gGwBdvZK/arpbNulzYM/LI1QMypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6pCgFnN; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74264d1832eso2686273b3a.0;
        Mon, 30 Jun 2025 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751290182; x=1751894982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LzTcO/m9tkAD8Gqe/zjzIYRZPiIiP4NraWiu1v8c0Q=;
        b=L6pCgFnN6/ZZ9DN8oEn4zfHTpIslk25cnbdWNmnxDvgm2c7KLsnhQwSo0S71YTcuzH
         GgUgcCsNBgLaZQ6YgmhA4nGyePFS8IL3sKy3edFVV97/fxFUBVsj3ZMR2UrXuuhYGDmm
         DQkdfBOZYJoP27DyETqL8n4/14fH4zLHKou/8JJ5J+JPIsXzGHeuTfmbkEiX/DeGXbvg
         btK2wpiCuQ0l+xNtjL4xOs2H31AS9cjvT3VoVnwHKutBvlXzZ0y3pbUnvZIGUFrr0ALQ
         hiDB5UXwqH4AUANJYUsLnXzjqu+PaKS3IBnhF2i71AUMmUc7l8KZr0Tg/mun4lK39WMk
         ZwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290182; x=1751894982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LzTcO/m9tkAD8Gqe/zjzIYRZPiIiP4NraWiu1v8c0Q=;
        b=Vqeoh9WhVWYcU9UcY4qtEWhSAjRU2CmiIMIPyUN3NTcjpGiwa1AwwSgNKp6tT6SL3W
         1L3zeerWdlK2NZ3F0eKkJjPqbGWkixJhhj2AA6eaGEgydK3/7FaP6mGYtl6IH1RUX2p4
         CI6L5qNl+k4vsk8dd28oYl2IbykJbjZZQ65DlhT0Ri9DIaqwLKpS5fAHLwOrFQFJ9cyf
         nEmeIEBWGKXzzShNLB0D166q2RuU5ATyGrevOh2J6Qn9K9QU+gEbx4HGvpkWBY7TsES2
         vSpHOd1LAibNaY7FtPiQH17UUGxvsH8BK6lPlvVAIeCjU3FoCpR1bc8eHA0V+YC/M9Gx
         VejA==
X-Forwarded-Encrypted: i=1; AJvYcCU6hch0MYMkBjH9zQsT5fEzXLUZeXyo48O9jpDEAuj8gWa7lp36OH2oz2cVpD/0go1KJPuHvk0w3Wzh@vger.kernel.org, AJvYcCUNDEmJneA315Uf3TlriBkTwnb4AR/UyQ1zqusVHBuDiNkmLjc52m0zCZa33o18UMlHh/Eyj+ElH+RivAWb@vger.kernel.org, AJvYcCVxnXhuGOXn0tk0YiQzY9GciobMv6iG7rLKNhDCkmNO0Yja8ze/gfYmzV+VPPuaNPYY5wwydLCd6tJ3uFOESvU=@vger.kernel.org, AJvYcCXiRFspMQB/XXpCCvdLEGetI35+gT2zWDtB08xI/XgJ64Iie6dtpbGM6/X/4qQSagQtnLTYZy9hB1AaMx34@vger.kernel.org
X-Gm-Message-State: AOJu0YzcxQkyPcdp9kZJ9pFMKpO6iJqcN9BLHkgN43Q2JBUJW2s/NXY9
	+ku34oPF76WdS2ysUPsxJl3Hpi2R2nFCWp4YQf5+mxaMc2Sy57wppdl4
X-Gm-Gg: ASbGncu5obdHDvXg8/KiqXeeMAsByE7psuDX7LF5evA5qib12VQ8T8V7B2NqORm9jyW
	u0FzfhpMIBZYXfBvo5MeFsvWe002qW8UV50Nrnme6ciopPZMj4xVj1JB3/KbvduI4K4iIlRo0do
	1JbX0wvoAABswMIQVc4mYOMUdJwQf4T7Buq2DIMJSZq0xCMTSPwor8hmVDEPFmDngm+B8+hemfE
	lqtg6KlyAbeF3MQryErLS3JeR/tDURDVSlfcnHGb6lFZpXCVItKguXsRbYhexSZKToqzLwxcHpn
	2E1DqbAEiJP6zuAeVX+CldiJvA1m23naDlMatN2llj/3T/cZFL3nyK3IJKGx6pqf8vVTS+tyZho
	=
X-Google-Smtp-Source: AGHT+IGvSGnok+XQLrJYo+ik4oz3Ag1fPM5VlkYA503/kIRfskW4gdLdiEAL+3hl/iMdowvVnXbgzw==
X-Received: by 2002:a05:6a00:997:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-74af6e3f46amr20055931b3a.3.1751290181725;
        Mon, 30 Jun 2025 06:29:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e655sm9110887b3a.65.2025.06.30.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:29:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 30 Jun 2025 06:29:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wctrl@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT6572
Message-ID: <f56c2213-e7ef-4b91-b843-e54d8821e044@roeck-us.net>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-4-f7f842196986@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-4-f7f842196986@proton.me>

On Thu, Jun 26, 2025 at 11:53:57AM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for watchdog on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 8d2520241e37f0e8a7526cbc99d5aa0d4edc9a55..ba0bfd73ab62a86befead007d4b7d2a870b81a0c 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -34,6 +34,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt2701-wdt
> +              - mediatek,mt6572-wdt
>                - mediatek,mt6582-wdt
>                - mediatek,mt6797-wdt
>                - mediatek,mt7622-wdt
> 
> -- 
> 2.50.0
> 
> 

