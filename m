Return-Path: <linux-watchdog+bounces-4217-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C569CB52B70
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Sep 2025 10:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DF551C84CF8
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Sep 2025 08:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9726D266B67;
	Thu, 11 Sep 2025 08:17:27 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D4219A86;
	Thu, 11 Sep 2025 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578647; cv=none; b=Q1zgTD0CetQr4y8nvwsOj+scu/TDBq+SOPzvtSyPh+z62jfaM5Kmt6WuhQtK8FMaDJRlhY7Sa4QgIIluLtPdvMpmgeCZ432iJkK67zqSDj7nE7mU00mj7sR5/yj67m/aBZFAZVWg/EvFp0VZfeISO+zHymdZvC1/dHlogW+Gx6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578647; c=relaxed/simple;
	bh=wHfI0Zex5SRmzFSXfaqcAMgB3WV407FMktikanLNJus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4GtXDBugvtSx+ExLQ6EJISLgP7cE2gyFxX6PadpW71Jn1RrzH0FUDq2hco4gwX612XbkcocBK6z+YfyF+GhrAV+tiIyQpcdmkT6H2Y0IuyxD2om8uweUq/5/6SPcaUawdWmsZfh7xUyDPr3/qI/gVfS8HaKoZyaw/2xlf2Adus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8902ee514deso317302241.1;
        Thu, 11 Sep 2025 01:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757578645; x=1758183445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=js/8UDggOvfLe3IaSH9Cswopzmf6KAi8oVvdx2AROQ0=;
        b=BeLK16/XMUj4JDxfgT++eu/RJ4nfOIhXcM3Y1cdnaST2mJbTXz3/jEeQYLx3eHxy+D
         iv8QFgGZpWRMa45JAu1aTqkHVDO7vuxIYRdUtGwsL1BT3AcxrUqQdZasG2WRF+aKn8Im
         yp3zEelLVZTD0KYWGOw0OL3lUY6bVppkhtvwFOinPLcTsJxpcrwD9UmuFU5es9FR8lER
         NI8Md1BNr5li843MbIrEpRiNlds/QbDfNIEV+5AZdjyv5rLuOvOM33r56UfmQ9fknVIn
         pvb8gU/cagYGO9qqHPUgesIdsemGS54sefV5VkBFw3GzE/NRXdaVM338zAw8Pcgg1xXl
         qb3A==
X-Forwarded-Encrypted: i=1; AJvYcCVVzaFU4h/6KrgUCPA+CnO02LsYxstg/ia3fHwhLV9dwyrUJ+N8wmjjkfuZqX5gIhsCfbRoOXCcBxk2@vger.kernel.org, AJvYcCVhaKzrHAnlSjv/qVMCs6TaU4GMRQgcn7juiPmuqdmi+z8R6STajGhkQYCPQczzx5XWgO4sgqoqoj4yGoBXN+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMcUIbManRNQK+/C5D122gWsMtWSG3GYXjsFkuDVQsa/bLG7OC
	YgzkpBH6fevqejCV1fQoFlvoi1r2uCS5hBSR+ikCV0WKxmIU+oAwL3RPXq3JiMnj
X-Gm-Gg: ASbGnctdvJGFt6jWKjKL2GSfDMv/QAZAtyFbGG22RSfj0e8hDxtH62Z9ngEWGrusNqb
	mJ61CKnH+Gdt0/qba/vWBjKDXGmV5Ugcg6SYPRY7uHMNmMDzTQqjb95sIemicUBQGK81aSa987J
	5K0F/eWAfI5kiqqw2CBoUyHHnub9+/3z6yESi174EDo5HcHOJhOWRzdWRzHg8NUvEeQ3Mv0lQ1F
	UD9eQcSwZa/EscomXK7CMOwU5WYoQffsL2OUrpakBqoUwee4BCn9CB+4f/gMrHxRxUyKg7KjFDk
	PnaI61Am9Fccueg0U3J3bvEk8bxaxWwkCVvjXImnkDhdSeY6iJhbGvTvH0Yd7FjeS2WK831wuYE
	YpKqmeSj4AsRQfrVPURNftmBZULPCN+Lj3nLDYVEGK1e/VGIcuUP3gv6UnXQT
X-Google-Smtp-Source: AGHT+IE6RMYmUnZQHYhALihC2o3qWVSpdKvqKrgo0MYV66KWCPN148hZCll52KkBMBRYxHpSznVryg==
X-Received: by 2002:a05:6102:292c:b0:528:9956:6a3d with SMTP id ada2fe7eead31-5520c29c86amr947316137.12.1757578644686;
        Thu, 11 Sep 2025 01:17:24 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd3bd595csm145490241.10.2025.09.11.01.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:17:24 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-528a601a3cbso925247137.1;
        Thu, 11 Sep 2025 01:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBEPA3MzEML76o1Du1UBYAlKXk0Y6szSmtGN2cB9EJ3xGpPhgh5H3yhR4Pgo1GqnVRdHr/oWGZkoPP@vger.kernel.org, AJvYcCVXUnWVuvxf2l4Bdeg0bwmwrEp86z13wsN9qKLGiCjOU/0WOWTR5+t86ad/S90RqQKDzbJJNe+Almjet7f9DQs=@vger.kernel.org
X-Received: by 2002:a67:e04b:0:b0:4e9:963a:a42b with SMTP id
 ada2fe7eead31-55207cdefc5mr588780137.8.1757578643963; Thu, 11 Sep 2025
 01:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910210646.2443-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250910210646.2443-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 10:17:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmxav90n=5P8E2hTW2AcBgopwX=yMTBaziQWrgZ3mcwQ@mail.gmail.com>
X-Gm-Features: AS18NWBMKbagIFfwdulwWim8tXBtXDY5-SJL7aFbkpUtfKOkvs80DJZv2jRtWt8
Message-ID: <CAMuHMdUmxav90n=5P8E2hTW2AcBgopwX=yMTBaziQWrgZ3mcwQ@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: watchdog: Add Renesas WWDT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 10 Sept 2025 at 23:19, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Describe the Windowed Watchdog timer found on Renesas R-Car SoCs from
> late Gen3 onwards.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,wwdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Windowed Watchdog Timer (WWDT) Controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a779g0-wwdt  # V4H
> +      - const: renesas,rcar-gen4-wwdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Pretimeout, 75% of overflow reached
> +      - description: Error occurred
> +
> +  interrupt-names:
> +    items:
> +      - const: pretimeout
> +      - const: error
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Counting clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: cnt
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Reset circuitry driven by bus clock
> +      - description: Reset circuitry driven by counting clock
> +
> +  reset-names:
> +    items:
> +      - const: bus
> +      - const: cnt
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

resets, pm-domains?

> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>

Please insert a blank line.

> +    wwdt0: watchdog@ffc90000 {
> +            compatible = "renesas,r8a779g0-wwdt",
> +                         "renesas,rcar-gen4-wwdt";
> +            reg = <0xffc90000 0x10>;
> +            interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "pretimeout", "error";
> +            clocks = <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>,
> +                     <&cpg CPG_CORE R8A779G0_CLK_R>;
> +            clock-names = "bus", "cnt";
> +            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +            resets = <&cpg 1318>, <&cpg 1200>;

The first reset is no longer documented in the latest R-Car V4H Hardware
User Manual (Rev.1.30).
It is not documented on R-Car Gen3, either.

> +            reset-names = "bus", "cnt";
> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

