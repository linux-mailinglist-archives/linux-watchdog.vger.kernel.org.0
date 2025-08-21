Return-Path: <linux-watchdog+bounces-4027-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26066B2EC6C
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 05:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A443E1CC50C5
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 03:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2125C2E7F3C;
	Thu, 21 Aug 2025 03:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuRE/tty"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABBD2E7F3E;
	Thu, 21 Aug 2025 03:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748316; cv=none; b=f7OR3OqAIkPhMspKSpT63QZbETeAhalQBsj9E7uT0xUpquZf4EWrs9BQ0yNWqcnSmvojtauQ1LrBpzIkaT9K1xj5XY2O4TZBn0kcVBlh7Ar87Puwf/aBbwDmzVPv4thDuj613ljZnN49ZaYpaVeWmEANGFlGg/7O7Bjzg3NkBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748316; c=relaxed/simple;
	bh=AUVo76PWlr0EWxclNeZcyo6xV9nFnkPuUQKtyGQwIoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnRyxYzzKVjUSDiNaIVVQCEyEB/+A07nNqHouye0RcD5Tx2fNFNHqdRfEnyH9GpBxtL019jPVo/tyTBG19Ng2jIrmCy3TJ2lVCSgrjYNzrEJrQSP00jfC+6VQvGRJx5z8QALwraDT9CVKXeJiqNzCm41vSVhdaBltgF/m5dGXV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XuRE/tty; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-323266d2d9eso438982a91.0;
        Wed, 20 Aug 2025 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755748313; x=1756353113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SXxswA8fj5FkcY/2ax+ewvXqc7samX9gc8sogWliBdQ=;
        b=XuRE/tty2PrUhSzVWlyXCNlUF45IZjnq1q0ESgXM+Uol9jBzHhTO81Zk6/zjJmyHxM
         urTyusezMGja4WmN05fZZhTiJmLZ234UvvAQJceZ2ymqoxioJt+EeqdfSvMj1GMqV/+s
         8n045VXEF4ecnGbQ/EZjLDaWzo0YlAqiiBtWRiWhMuKFkkGDu1wzx8bdSjmb5Tq4Kv3L
         fHHR/PLJVja5E7Md81S2UfesKzjxgC91tiIj45MmE47yw/H5oI9R1nxboYM6CBAOvgNf
         8BUzc2c/yHisSHUdbNtAM3OmSQLa1yQf9rBCiFjSce7kXLDm3wq9ymrDhKxfsvv5Zd5W
         pMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755748313; x=1756353113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXxswA8fj5FkcY/2ax+ewvXqc7samX9gc8sogWliBdQ=;
        b=PvR5JDyFFCaz/6SNkk2hYADi/YWRYYZV8NHdmrB5+4yeWJdrVkzeigNGLRlNWmh2nn
         SrphY5BWHgvIStp11hYZMUjojQYsMf9Eg7SV8b+3z9b2Wdc+O5gR5nIShYU4pPd3KyH5
         /rioJatr0GxgoiQ8IyS0CioVxSaxyGq/zwIUZAnQrPwI5Eo+YtKzbknRPB5k6UeEtPkC
         WvJvgkFEiYAsA/HKgmLvN9NvwLMoEmvtIW/1DEsxTMggNdoFLr8K8awfC8+fGdJ3yANn
         n3SATjHGg2G3AjN03dQqrDzMVLpbLOk4jBO0vB5YTIX2+oAwc1qKwqTr92Xc4ESPZJvH
         YTXg==
X-Forwarded-Encrypted: i=1; AJvYcCUe1RXaddsheWdZN7U6tL1aM4n/jyaHc+ZLeWU4sU7V7I47FsY9HW0+QBsmwMU5wy5l7v1TGG9BnuPaJLepvz2jlcE=@vger.kernel.org, AJvYcCVjtPb7+wm5llCfeQQe2G7MjWc2dUEEPz46o7dOZw1wpJ1bjiHAI50c5wnPOyfWPtrMuXnTzp/ZFDPKQBYg@vger.kernel.org, AJvYcCXAkiBteo0dDV/9JaqGfoDPvzpVHz81ujL8R9H+d0mdtUEpleoEXH9a3XdgXvur/EhLkO3OJLqwaWT1@vger.kernel.org
X-Gm-Message-State: AOJu0YwbdXtqxfG2yWCzJ95sKI8uNq3KMYxf0UfVCYPLxUPyMx8n+Xkq
	AxlG6I1S2AIHqbah17Gh9mYkAmK77MCE75IHJfWXod2fWpYeJXndOl9D
X-Gm-Gg: ASbGnct/gXoXTTQHykWyyFKN4pqILQkxZ9AgV7SxfpaDnGUx7DsObXahHusvPSCQONb
	dmnKTOCedUcKX757WFam7FM8C1aTPprfETgABibZptv2A710GVdMfgyfzsw6+K5IS5raUPGL45j
	fGFLTzj+ywR9Iv0J4enlKqiw5NCdI98PB2kOAKVi3upGkjdJL9kY0in9IpWHqIoIK26/Diyd7F+
	eGV06fC507kndNpJYAc5KGzgkvNsW0oW/swA6l/OjQjII+xzAR5HA51Kjwn/G/mOwIPZalADV5F
	52vTMJO4VAb9DP3DA3LhQIbxNSxPqzKX0NkNa4fPmja4x7oFmzUZelLOqAKmZxuBwgN5Otg74KK
	nUy8+DQf1iIKd6VjsaqVooc9G9OSbwELSvKPFAIJOyPGA43TxaZ+uZqqguNrX8ylYv34gLRB2LE
	bd+lDvLg==
X-Google-Smtp-Source: AGHT+IEwdG7b/zyrxugqxS19jjdhBSYJ8MGE9COorTJ3ktwcBVABH+KcfX8Fy3glx6jvHwaNnW8pwA==
X-Received: by 2002:a17:90b:3504:b0:321:cf49:2c04 with SMTP id 98e67ed59e1d1-324ed073647mr1277524a91.9.1755748313341;
        Wed, 20 Aug 2025 20:51:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640d508esm3632171a12.58.2025.08.20.20.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 20:51:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e4aee9b2-5085-4424-a7c6-0b7e2e63ccc3@roeck-us.net>
Date: Wed, 20 Aug 2025 20:51:51 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] watchdog: rzv2h: Add support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250820202322.2051969-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250820202322.2051969-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 13:23, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the RZ/T2H watchdog timer. The RZ/T2H requires control of
> the watchdog counter using the WDT Debug Control Register (WDTDCR), which
> allows explicitly stopping and starting the counter. This behavior differs
> from RZ/V2H, which doesn't have WDTDCR, so the driver is extended to handle
> this requirement.
> 
> To support this, a new `wdtdcr` flag is introduced in the `rzv2h_of_data`
> structure. When set, the driver maps the WDTDCR register and uses it to
> control the watchdog counter in the start, stop, and restart callbacks.
> Additionally, the clock divisor and count source for RZ/T2H are defined
> to match its hardware configuration.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

