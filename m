Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B140917C188
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 16:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgCFPSj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 10:18:39 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34178 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgCFPSi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 10:18:38 -0500
Received: by mail-pf1-f195.google.com with SMTP id y21so1273186pfp.1;
        Fri, 06 Mar 2020 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zF1aUPvrJoqRWvHW9G34N4+Iycf5hM+l/TP/8XyWQD8=;
        b=A26MYVGfEA/Zuj8FOfgiJXRYeX28jXApvtoXKSv9nyRC84S6lRoJR1PWCzLpPG2f3b
         FELSFYtlTyuio+UT6fFOdzHcvxCTylelBkDeD9rX3+u9x2hc4S5lWyIHm2ZuYCI7VMJP
         R/VZFv25I5/mQx0cc1YAG4Mo8LxUWJ4CIzFKoVP3g6xEhpnEyKAQFjqFs3Zk8z/LGV/I
         AlD2dDx/l89pt0B4Pr3zsOdYn5f45X7TyJoF/W/gsAiJl+z12Ov/iPHs9Ujb2soEg9o6
         X6IvcW0uEudYOavQfEHWDsk1GN5PokyHBx2PRF+uGDQW4S2tkYy85rhRYJPAvDrYkfU0
         enQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zF1aUPvrJoqRWvHW9G34N4+Iycf5hM+l/TP/8XyWQD8=;
        b=M2iOoRHAWfW4G7gQ7NtxSkaWoQ/xxY4RSnGSERi22Uxre+XnI+S+yRL+2r4/y6fl4p
         eSYeOr1c97rIB5famjUdh7Ne9Dd+VuuCsATOx1v+CAdPjEBYWa7j8A/XE8LBU3k9UGhj
         zzzYme4W8bAsSpycCCz7BXpyzq5n1Ckq3QlxHoiMtRef1NvU2DZkrXOi5oGy1/WCs/5S
         BkZo/UognI9qmnpKzKZ9U8A7kz417gzlABlJgfzA/Cny7GtsXDFQ/BszgCWY/7ZGODDl
         2riu1WNK3FcekVIva5HlxGB7MydC4+lFUHSFi7dhro9YXowd0bPxT4YYsmShpOmWUopB
         1CEA==
X-Gm-Message-State: ANhLgQ1B7ytM8cw/0QmN2J7XqRjtsEVlGAPWKzt5obDKylQQZ3OiPKj9
        6c3j3GjaGgGzW055fExBFPPuKYY1
X-Google-Smtp-Source: ADFU+vtYdSzic5qCSzVitOM5a6jZ6lRZWREC3pEXRO0lfFBvy/OAkyViWAOLv+4Hi24i2btOedRSAg==
X-Received: by 2002:aa7:858a:: with SMTP id w10mr4200185pfn.210.1583507916924;
        Fri, 06 Mar 2020 07:18:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x3sm9785005pjq.5.2020.03.06.07.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 07:18:36 -0800 (PST)
Subject: Re: [PATCH 1/7] dt-bindings: watchdog: dw-wdt: Replace legacy
 bindings file with YAML-based one
To:     Sergey.Semin@baikalelectronics.ru,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132803.770DC8030792@mail.baikalelectronics.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8c10be04-5aa2-af5e-7b15-262dcdc04875@roeck-us.net>
Date:   Fri, 6 Mar 2020 07:18:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306132803.770DC8030792@mail.baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/6/20 5:27 AM, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Modern device tree bindings are supposed to be created as YAML-files
> in accordane with dt-schema. This commit replaces the DW Watchdog
> legacy bare text bindings with YAML file. As before the the bindings
> states that the corresponding dts node is supposed to have a registers
> range reference, at least one clocks phandle reference, optional reset
> lines. Seeing all the platforms with DW Watchdog provide the watchdog
> interrupt property and since in further commit we'll alter the driver
> to use it for pre-timeout functionality implementation, lets declare
> the IRQ property to be required.
> 

First, this is not just a replacement - it changes semantics.

Second, I disagree with making interrupts mandatory. They are only needed
for pretimeout functionality, and not everyone may want to enable that.
I don't see the point of forcing everyone to enable and provide functionality
that is neither wanted or needed for a given use case. Yes, the interrupt
is provided by all users today, but we may have one coming up tomorrow
where the interrupt line is not even wired up. What then ?

Guenter

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  .../devicetree/bindings/watchdog/dw_wdt.txt   | 24 -------
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
> deleted file mode 100644
> index eb0914420c7c..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Synopsys Designware Watchdog Timer
> -
> -Required Properties:
> -
> -- compatible	: Should contain "snps,dw-wdt"
> -- reg		: Base address and size of the watchdog timer registers.
> -- clocks	: phandle + clock-specifier for the clock that drives the
> -		watchdog timer.
> -
> -Optional Properties:
> -
> -- interrupts	: The interrupt used for the watchdog timeout warning.
> -- resets	: phandle pointing to the system reset controller with
> -		line index for the watchdog.
> -
> -Example:
> -
> -	watchdog0: wd@ffd02000 {
> -		compatible = "snps,dw-wdt";
> -		reg = <0xffd02000 0x1000>;
> -		interrupts = <0 171 4>;
> -		clocks = <&per_base_clk>;
> -		resets = <&rst WDT0_RESET>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> new file mode 100644
> index 000000000000..8b30f9601c38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) 2019 BAIKAL ELECTRONICS, JSC
> +#
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys Designware Watchdog Timer
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Jamie Iles <jamie@jamieiles.com>
> +
> +properties:
> +  compatible:
> +    const: snps,dw-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: DW Watchdog pre-timeout interrupts.
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Watchdog timer reference clock.
> +      - description: APB3 interface clock.
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: tclk
> +      - const: pclk
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-rates: true
> +
> +  resets:
> +    description: Phandle to the DW Watchdog reset lane.
> +    maxItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    watchdog0: watchdog@ffd02000 {
> +      compatible = "snps,dw-wdt";
> +      reg = <0xffd02000 0x1000>;
> +      interrupts = <0 171 4>;
> +      clocks = <&per_base_clk>;
> +      resets = <&wdt_rst>;
> +    };
> +...
> 

