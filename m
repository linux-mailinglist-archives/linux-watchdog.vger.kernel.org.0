Return-Path: <linux-watchdog+bounces-4269-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154EB9ACB1
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 18:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF70217C3ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 16:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BD1313275;
	Wed, 24 Sep 2025 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVwQsUWQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395F3128CD
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729599; cv=none; b=ainQpzYBYttXq7BpBsaS652Dd62CsAe9Qru73Z4KmrokPWNbGbpNCXplCKUvpruYEiqxVgS+q/9+VdxEEbk5BFlD/9lP2rdf9MamLPA7dESCIBNDybwkcAyn1b/Xr/WqA6Tr1kANCF9J5xbEXY9i+cvY1BVEbBYzJe1y9+TF+Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729599; c=relaxed/simple;
	bh=cPOvD0RWj5XRQ1X63jkqRBqkK//fpnkcUP8Ht39fsXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZZTKWU8NY55Qh25zBy+SFv7xEd47yRfgG3TZN6WJCUEnbALG7MxPdbcrp+4su9XG2umTE/y/GFc0CwjGBJVbqE0zaaqS3FZW3KFsIofBWpb3JZSYiC36CGwvF/YfhkkNdugu+kNiAyhsT4KZ/z7b+U5OI/P1O2YfB5fjXnmto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVwQsUWQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f429ea4d5so9907b3a.0
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729597; x=1759334397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Axp+Y7n48EcMK3tr2yHFXpOpdW4+znYlp/0VpLugUQ0=;
        b=eVwQsUWQCcG86MsAxjTDg/0U5BkA0QjLR8XrjOmkQEXfzoo/FfsIFocWF8ZCzpwtxt
         0RL+7XtO0QDV+thFaUzb+9TDcXUFTxwBfTiNpzyVjHhSo22TDAAb+M8a1ftBmXfHKUXe
         zXKZhctPhjHa2KBHARtcwveg3+3entekV+AQfsXFK+Uvi2SAupTpElCc0zP04dQS4laF
         1oFsVbkRe22JTs289UmJk9Mg2IG+fIzBMe68yanw2vLrP3q92fqzA2LOZuf77kb1xy+A
         vF73L3qdnsKXHybHdDVyEZPbqBUfVH7AOrcMTU7AOwPd10GI7t0k4mPqVnhcZgVHkaan
         DAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729597; x=1759334397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Axp+Y7n48EcMK3tr2yHFXpOpdW4+znYlp/0VpLugUQ0=;
        b=Def2IDBnw8Hz8z/wI+aGI5Of28RemDhgJbBB+HINvryKMZ03kQAAw1oMf8tVlcPNTc
         umt9o75SK279jGA+29OwAnO9pqtV9EBw9B3gumlT8ljeEYKAgMojuq0IMKfjKIyn8H7G
         BXhCMV+CN4e6zGnsrVDbRfaHFqI0w+7K3XUEBQz5D/Y3TA98zWei1HQmWEJhJmhU/2YR
         Ak06HmXl2WGV3WpgsURX4TTpT3mCMVJ76KtHHlkdCCYPOrka7Hava18ueHlJdoUA5ylN
         XkInIfZ8Cn+36VBr3utctJt//VA/yoomKCm0n9d+d8NUIHcLjJpWiZ7lkKkbWSNTsqeB
         cAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3O+L5v2pNyba+xWzyMkCiJvJV7XSEgLglbrraLBlAK5P8igb9tZkEAxFUoVPqzzxfssSJ+u3rA8Dx8p2xag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXF+QBr36fbz535K+TWl36k0pq+Zo1FJeIJQZZvUkz2pTiPxFU
	atQbtguntKqsfkVcQBeJakYgZDHY8taB367Uk/GLsfzwBLpaIPAilwgkUswao1r6
X-Gm-Gg: ASbGncvlabRc0U/M21Sqnp6BWhVCEz+BIJn4Ieah6wNfDx8+6/sZQGtFG3gHFQhdNAH
	PuMAjHlyotg47VPqzV/oClFo5OuxikV3cbzPN2UqtQaoBIVYDDWt1Flpq6F8+yKxYU17IdQ5Hnu
	TwXAavoxh6V47VXoQgEEEO09XueDFUmmbvG4mO/qpt+1JbANJgayLZkKmTNtyycb3tBCmvasioL
	fnLC4iZH5sZsQ3JvTrTisuCYHcW6KTKBXFgdPKUvto1vLWvQKhxgfM2QQvSVFCiNfiTjxpj1b+4
	ZOE/5mSeNP6i2uB26yxlQ6VRV/qOEZuc+wWGSPMkWD4Y7+12/9VYkmzoXaER1phCn5Q7/HPiHQ4
	C/itVPn+kwacQR6mgvXjKiHjTHeN8mLomNhg=
X-Google-Smtp-Source: AGHT+IEaXCmea0lHklJdK2j0b9lkEP9FEm4EgHcCJQjQymM5qCQpNWQ5k2IXyH2sa8ZgsZ0NbBXZyg==
X-Received: by 2002:a05:6a00:3983:b0:77f:4c3e:c19d with SMTP id d2e1a72fcca58-780fce1f0a6mr534663b3a.12.1758729597476;
        Wed, 24 Sep 2025 08:59:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-780fc88c823sm416136b3a.54.2025.09.24.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:59:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 08:59:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: watchdog: add SMARC-sAM67 support
Message-ID: <93fa6a60-1a12-47b6-b777-0f6f7775d49c@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-6-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-6-mwalle@kernel.org>

On Fri, Sep 12, 2025 at 02:07:43PM +0200, Michael Walle wrote:
> The SMARC-sAM67 board has an on-board uC which has the same register
> interface as the older CPLD implementation on the SMARC-sAL28 board.
> Although the MCU emulates the same behavior, be prepared for any quirks
> and add a board specific compatible.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> index 872a8471ef65..0821ba0e84a3 100644
> --- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> @@ -18,7 +18,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: kontron,sl28cpld-wdt
> +    oneOf:
> +      - items:
> +          - enum:
> +              - kontron,sa67mcu-wdt
> +          - const: kontron,sl28cpld-wdt
> +      - const: kontron,sl28cpld-wdt
>  
>    reg:
>      maxItems: 1

