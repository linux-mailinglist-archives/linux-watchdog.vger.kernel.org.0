Return-Path: <linux-watchdog+bounces-4023-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A4B2EC53
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 05:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 131A35E61DB
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 03:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187D82E091C;
	Thu, 21 Aug 2025 03:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRSGzGcs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9251B3D81;
	Thu, 21 Aug 2025 03:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748205; cv=none; b=HuYpvfxrhilGLDgPD4zJD7fDlI07holVktlpAzrB3ukngNwOIiZ1b7vni4AfnnpoMfNgO8Fulq8e1pMt/byFwXWaJWdUpNO+quMCFvGBoSNiDb1206ZaQW1SkTxSl+J3kGJZC5eBIDRHvtb1ss1veR3FcGF81uvqqyyct1Vk+ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748205; c=relaxed/simple;
	bh=b1yfd1VFTFN/wS3dKvrCwiU4LC2BeGG5Fuc37E3DsJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5LjrdzAdn4VjWNMDnKaW9H50ttYl8a3lrYEi5jk+ZmvpsQTRUaBFLcAUyQx1EiVuU/SRIV9oiwMB6NrFi02VuQoYwS7bG9cDSb8vxlndnKBCg86rE6lZ/PvmmrQjT567uU4SX7pjrUiLfg32l7bE3ifrTuD9ozWaYFcrHaZsP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRSGzGcs; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e92b3ded3so309143b3a.2;
        Wed, 20 Aug 2025 20:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755748203; x=1756353003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mnaXP4zOOnYK7fSgN0I2f7dyE5wgIRCSVuI0TvlkemQ=;
        b=FRSGzGcsGVtinxVVq4c8+w3IMRSDJ1ZktnFjdlWUBy0MoQh+o63PTDLB6pzaXfYQ25
         0HyQHrBWFAYbNrCsag2O5d6FozV7LAyfIi+KD1qYgdQY9QEng+7kSO6YS7zC7iGrAFUB
         sS23c6+kD2d+o4lLC46tEFVYqgTm5C8BifpeyHumVNfYQ8sw+tGd4SbrPeIKsDpdV8rL
         Y4J2vnli98Dlr01fqOxmMP4BlYAh6j3Fpfv+tOtMnn+RQkelYCH0yzIbHwrOfMODqXtx
         QYQTLiH+zcejVjpnJfFAcHjFPDcBvXZo6teWNh0GX246ndgTZcy6QHNF/nzZ+lXd22CB
         RRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755748203; x=1756353003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnaXP4zOOnYK7fSgN0I2f7dyE5wgIRCSVuI0TvlkemQ=;
        b=Tzm2BWeW0APRm4T40VfHDsuz/cJKOarZj3t9D1Ji3rsYocOFFZN9uftCMKFss9g4vn
         6gKoHYTUa9HzLCejtpJm8+yg+SolUCeXboQvDTZFBdlGjsISPV3Q+hha70PY72kAPmqH
         Lr167xJWL1UvFNZZbjQVPeilwh/Cd4jGsI0pjcQUIadED1QVFtQw7D0kXA16iCPTQANw
         BJx2uq51Rjt2qmN+0v0SX4OCyOcfCTlB+UFMBjb2utK3laZ9aZ4jlhqkiw90ypFZb9VG
         5z7AWzw4TszwKe5yqGdduJtDcFk/YuziUDunCH25Y1ScmRJSu/9DbGzRJ1XQv6fXrZVd
         Qt1g==
X-Forwarded-Encrypted: i=1; AJvYcCUg9nw8d1zp0/0VhJXuIWs9wIc9dHz3QfRQHFd17P3BVpYV1a+HFYx78oIxrhc1Q4DIaZKJATk+z0UB@vger.kernel.org, AJvYcCUvKuqbNmr+He+rcHFv6bOvLYXGnCf0b9AKtbjvV6jBh9uAjEp6nLOmXxkfntDQ2rzmmx3lJHooIrPRFhqx@vger.kernel.org, AJvYcCXRcLumIq8yJnQVw7yoWCL7riZm9emxUfGALA3P+Nke21HJrWENuKqAtaWcGknRq3RDUG+ovEuHK57t6kobpQoBtgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTqd8nd442g4+U1ED27g1yrBQATM1eckSwK/CQ3QNsmbcSFj+
	I/SStsoDFOWr1ZmJQAC3rr2xPVp2LJS+vfSTFphxVvxq8+2X94zC8OfitvGH7g==
X-Gm-Gg: ASbGncuOBbS6LOCk9hZuWQJk2ccYQpr+QMdiZZ6osvgGN/1/EqDoQa/p12NF8yN8qKt
	zn2L8IEMOzsBUDVKWnET4cVcz24RPboEp+2p5XGRT9F4c1z8nNnubd+yo26hfbVfrvY48RBdw8t
	7Mgu9C3vYbPACI5zETsSZm7Uy61qLkwgMzqWyBV7fyEpCzC/ey1RDmXoieuJ5i12aAuRx100xqd
	EtIrqZzJ/F6I7znFD+e6kE0nVmJC1Wi9RgW3iE1QqnLPqkvx6bLh/ODgCWFerQcKMLtNvCrK/Hp
	lSGntTjuULRgWt7gXoPYasWdOpLjMgw1tVMu1mdvShMm0TdRV7LRh+bhrzI0p0DTRmpQwFs4EPo
	VdtOIQuUnZNHnU2wMmW+t5g8M+Ikw2T8EiZadidwBQ9zsENE/pXfzlNiAFTfuUWrw20mPx5Y=
X-Google-Smtp-Source: AGHT+IGHT+pydBpObdLmn9RUfpYsGby8GQ1hv20GfrJYJgBTjRTWpEjoZqSBXgi3EkGbbgLN32zHlA==
X-Received: by 2002:a05:6a20:7489:b0:240:16ef:ec16 with SMTP id adf61e73a8af0-24330b23e0emr1203807637.46.1755748202601;
        Wed, 20 Aug 2025 20:50:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e951da867sm2930342b3a.102.2025.08.20.20.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 20:50:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <25140dcc-fcd5-476f-8c26-7e99c7381552@roeck-us.net>
Date: Wed, 20 Aug 2025 20:50:00 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: watchdog: renesas,wdt: Add support
 for RZ/T2H and RZ/N2H
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
 <20250820202322.2051969-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250820202322.2051969-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 13:23, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Extend the Renesas WDT device tree bindings to support the watchdog timer
> found on the RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> 
> The RZ/T2H WDT is mostly compatible with the one found on the RZ/V2H(P),
> but includes an additional register and differs in the clock division
> ratio settings for the WDTCR[CKS] field. To reflect these differences,
> introduce a new compatible string, "renesas,r9a09g077-wdt".
> 
> The binding schema is updated accordingly. On RZ/T2H, the WDT does not
> require the "resets" property. It also requires two register regions and
> the presence of a "power-domains" property. The "clock-names" property is
> limited to a single entry, "pclk", for this SoC.
> 
> The RZ/N2H SoC uses the same WDT IP as the RZ/T2H. It is supported by
> using "renesas,r9a09g087-wdt" as the primary compatible string, with
> "renesas,r9a09g077-wdt" listed as a fallback to describe the shared
> hardware features.
> 
> Example:
>      wdt0: watchdog@80082000 {
>          compatible = "renesas,r9a09g077-wdt";
>          reg = <0 0x80082000 0 0x400>,
>                <0 0x81295100 0 0x04>;
>          clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
>          clock-names = "pclk";
>          power-domains = <&cpg>;
>          status = "disabled";
>      };
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


