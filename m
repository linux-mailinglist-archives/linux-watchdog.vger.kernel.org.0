Return-Path: <linux-watchdog+bounces-280-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FD80F3B2
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 17:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208EB1F215E6
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 16:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF14F7B3A4;
	Tue, 12 Dec 2023 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfo6NM+i"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8680CE9;
	Tue, 12 Dec 2023 08:56:02 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b9d2b8c3c6so4411751b6e.1;
        Tue, 12 Dec 2023 08:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702400162; x=1703004962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6ivGn4rGfCASPt3DuLCJH1sjecJOwY1PoOcRd7pg4U=;
        b=gfo6NM+iE0hZCSFRuBZUxeRfGKuFsHiPjr7XHyl9V3mA6FMWjFQzpRk8clPJTnjwOU
         RVdnQwrAASoC11qa/ITIKMyjfwSP2w2NXaJiVMKh6wTTLEemqZIMYvtHd/jsuB1k4k4l
         EJwt8GwTy/St6FxU118ohCEc8+pJQ882f4c9XQJifTYvv7ceEgIzeUPENcaC/M5Y0Rie
         tNjoWWqMgRR+8pbgS53nI5ewXjwttx+HHDY0LhgFmE+vN+yEzVNh7GhxaSNELoqM9Lrd
         KoXJ7voidGHJvYl8k9aK7EncvPJAxqWaipM4q6cO3H1ZIAtfi2RcZ3n8QOJ7V3mWxzqg
         g78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400162; x=1703004962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6ivGn4rGfCASPt3DuLCJH1sjecJOwY1PoOcRd7pg4U=;
        b=U8lE3XLBFRbI5gNAYXVMYz6aAaifMW3rEwKbFK0tXUMUgFvskxcf5A7W6dyBo5Ko54
         +ha+cxd+63ERgl1VbGBo+krbVPnYlmszFX5mceZVYN0BZTARpbtzfd5eYsDJmO7Pptn6
         ValHFU6B1LsAih74arVvWiI1x1RRxai5VG2sMdduLQESqndBqzMgIe3vkGejqvQwlS+D
         81DK2LIyp6OxOdDxmLAh/MCuwnmhafmnxzWegJojauq97Q1Ew6Y+UctYOPN0RkC7sclF
         dfwD2CVg+ZVDzBs65MU9O6UgS6Db6oQkgCzJaq51smhEVi3YEj/RqM1jT78sxvnGEU2R
         BywA==
X-Gm-Message-State: AOJu0Ywz5I7q8DnVjNKkDEptzmP9iEsO3k4+6jHJ+uzTGxUFzyX/ifCS
	zlxeEivfTWm538HRWY6phlA=
X-Google-Smtp-Source: AGHT+IEj8dy5JxVZeY50pa5vbGsXla0OALH4vjaKtaqkbKs1s++LnjmJbY4EgzS0C/Czj4V8Ep9DGQ==
X-Received: by 2002:a05:6808:4444:b0:3ba:459:11f5 with SMTP id ep4-20020a056808444400b003ba045911f5mr7275695oib.5.1702400161777;
        Tue, 12 Dec 2023 08:56:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 25-20020aca2119000000b003b274008e46sm2457297oiz.0.2023.12.12.08.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 08:56:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Dec 2023 08:56:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3.1 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Message-ID: <a16592d3-e924-435c-bfb0-2b0f2b3cf0a9@roeck-us.net>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204172510.35041-3-biju.das.jz@bp.renesas.com>

On Mon, Dec 04, 2023 at 05:25:04PM +0000, Biju Das wrote:
> The DA9061 watchdog is identical to DA9062 watchdog, so no driver changes
> are required. The fallback compatible string "dlg,da9062-watchdog" will be
> used on DA9061 watchdog.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v3->v3.1:
>  * Dropped comment for d9061 watchdog fallback.
>  * Replaced enum->const for dlg,da9061-watchdog and its fallback.
> v2->v3:
>  * No change
> v2:
>  * New patch
> ---
>  .../bindings/watchdog/dlg,da9062-watchdog.yaml         | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> index f058628bb632..7c63b99dac85 100644
> --- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> @@ -14,9 +14,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum: 
> -      - dlg,da9061-watchdog
> -      - dlg,da9062-watchdog
> +    oneOf:
> +      - items:
> +          - enum:
> +              - dlg,da9062-watchdog
> +      - items:
> +          - const: dlg,da9061-watchdog
> +          - const: dlg,da9062-watchdog
>  
>    dlg,use-sw-pm:
>      type: boolean
> -- 
> 2.39.2
> 

