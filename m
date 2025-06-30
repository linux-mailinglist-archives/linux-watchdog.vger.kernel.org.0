Return-Path: <linux-watchdog+bounces-3767-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC80AEDF1C
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 15:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48DCC16259B
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31C728B3F6;
	Mon, 30 Jun 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ain0cqz7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F28285CBA;
	Mon, 30 Jun 2025 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290219; cv=none; b=W9g8K8FIt991oxpff/QM6FOX6dy5Fq9v+F2LMOE3qoC+7K/QoRdwGK8MJCpUJV21z6oY768tCL/HvCTySdnVXuTT2AXC5Pza7R6az0jGCwDOAAeDxSA+36n54n3OoG0t24DvXVr/vwiMdHlRBB2jkECtQKSdcStxHKUill91Q5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290219; c=relaxed/simple;
	bh=k/F7wzi/Oivivw2NvLIoEktel4OXBWBf1njcoWD3Dbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1ENwTTUijHaFLlAjyHUMlINvvpArns/mLafB702OxUnEsy1yWNthhK5HgBrYIfPPBMVPuhPqS0JKQIIQQfm4Vt7z+JbXDc5tBnFn8wOvMcDAqdtdFhk1X/qsdVKQme9qAUIT3SMVnrXI42M52CYQyT73lV3s0CMOjHFEPcjU6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ain0cqz7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748e81d37a7so3169806b3a.1;
        Mon, 30 Jun 2025 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751290217; x=1751895017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqz5wu4a9+fyxIcUMARw02jDw0fFs9t8Ss/9EgTuY8g=;
        b=Ain0cqz7AzWP/YEgejlwFZ1Fq4kHMKHKkhfGuO9loCElgYoFqg24rzbxzmkrRhDqg8
         Rt6SLbY+/LiTsVfa7Rj5LLKqHeXYSvSZ3mB8e3PYU+MIqawZf1KintQt46sBmqCLZISs
         CTP82KL+oKhHBMJIVXo+2At/e4KYEFEJfF2MrW8asxpcMBM1Qm103oK5UgmH55nUCJpb
         +MNrJt4p6QSZYOZqVhzZgOn6l/JrLrVOKlmcmiASQkuGtnM9RNSYRAUgaBmpeUC/DjkH
         XX0jzzb8/5RS86iq+kebu5tgLzIXIUXSGParYI2ganJ/pktffCfTAjnrGd9HpvBWQHwb
         8VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290217; x=1751895017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqz5wu4a9+fyxIcUMARw02jDw0fFs9t8Ss/9EgTuY8g=;
        b=sG3Xgtu590GV/ed776BSjv3QpO5NOJviQNYm6NVsHZ8KuOZrLWzYKpvetd7v4KH2mP
         n/TKZ1z1rQA98+yeOPwhCQ3mphMRHVdyuHZR8NF5JTIMROaxTSGNB0FpzbtGnUKw8rwc
         hVLmWxdPGyCjfAgcDF/a6Us850+KtBli0RIdV8fTico+1sS9DkFMHf/EBOkjtrMmfmfd
         qtK32Mn8gmhpYKYAre0rmlAMR5a4746wuMy+UvppLh6WF/dL9fiPoZAn5QdQSb3M/XzM
         fT7V+zEn9xFvWV+PGt2+CWRy3MfMruc8FoCnDhyfQk5ki4LaPw/BiN7ieoaXRK7l9jPV
         tdPA==
X-Forwarded-Encrypted: i=1; AJvYcCU4cRiNw5k3axz8WMBSzRXXP7Mq/GXCuMQXnCMoST8vzc86/3A/sX+B4rp+9MNmUP1YsWZk7cIF5MY7CriS@vger.kernel.org, AJvYcCWKCHYPPol70EKpfU85J1dUpAvls4+f5PD+OzO1lYosbriAx9Ga6PmYeU5fvQ16VNOio02KB3i34leHxas9@vger.kernel.org, AJvYcCXCN9jqCbNkKttJVmSAfr7oDShOyAIxMtFfGZop2Y9Ml1i4w8BwJSbwEfpQTcE9C4E6+27xvNVfTKhD8Zab6Sk=@vger.kernel.org, AJvYcCXafwvTsaHGOHUtM9NZ/x6YRwHOMpAmA5rhVEKnpFyYrndzQ31Ua4lQOqArfuPF+vl4EqzBw5oZ27FX@vger.kernel.org
X-Gm-Message-State: AOJu0YzVcgnv9iiKtDfwjFYjdEuhf0ZqJt/ACMvHYvKPxvTBORZ3Ldmw
	q9kivacinp/uRIyG4TjnkWpTjgcrLVbRRN6fruSXoLkumSjbBoZcHZlT
X-Gm-Gg: ASbGncvpo2+znEfScT244iy5o472D5lVp98lUN6iffuQtN8WlGxD9TyWj7Y/5w8Zlqb
	f3p9myKFMuVQlOsHk2B7eRFuv2jd5lQqfNlfPoly7T8kui/0x+AowlbC7YtibQhIQb6YuuGH4B6
	a0I/+wIoF2mHEGRFAWzeXi15pPjNZchG9GiDgosCMDSdDzSBbVF2gTkr/YF5nXLDiUkAxFWQ0/5
	aeUpY5B/E+MMCMpcq64Fn9xJs7Jhkntzr2CggCSesyaQzBC5pTTCYwtN1Tkj5yAkkiHg7dDh7c1
	lYJCZ1LlAc7fMXQ9fb5UkfcSc+jYIuRApRENGMoXnLMdkFJjuI/7wTwtiuMUp74fbKyPv/2ut65
	P+FIpnHFbMg==
X-Google-Smtp-Source: AGHT+IHsEfXOWrT8Uf27lIFmnKIwzXoqP5mPWVdDMXddwdbdnzqfqiqgg5d8T6nDpFccz1puGjbcBw==
X-Received: by 2002:a05:6a20:c90e:b0:21f:53e4:1925 with SMTP id adf61e73a8af0-220a12dbff0mr19639755637.10.1751290217517;
        Mon, 30 Jun 2025 06:30:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b350d81f0ecsm2964147a12.27.2025.06.30.06.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:30:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 30 Jun 2025 06:30:15 -0700
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
Subject: Re: [PATCH v2 05/11] dt-bindings: vendor-prefixes: add JTY
Message-ID: <4c48a544-1252-40fe-8dd7-17ec848f6957@roeck-us.net>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-5-f7f842196986@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-5-f7f842196986@proton.me>

On Thu, Jun 26, 2025 at 11:53:58AM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> JTY produced low-cost Android tablets based on various
> MediaTek MT65xx SoCs.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 86f6a19b28ae217643bf7a63a471f74819d18238..517bd129288c96483ffe358127ce8e16f60d902b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -782,6 +782,8 @@ patternProperties:
>      description: Jide Tech
>    "^joz,.*":
>      description: JOZ BV
> +  "^jty,.*":
> +    description: JTY
>    "^kam,.*":
>      description: Kamstrup A/S
>    "^karo,.*":
> 
> -- 
> 2.50.0
> 
> 

