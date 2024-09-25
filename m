Return-Path: <linux-watchdog+bounces-2047-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 066029855DC
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 10:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77EF41F21353
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 08:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A837B15747D;
	Wed, 25 Sep 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpDQU6wD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F512AE6C;
	Wed, 25 Sep 2024 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727254399; cv=none; b=Pq1Re2xpwBzr0nC7QTT6yvLU3P7F3m4IEXbmmpGNWiV89xOvS58425fspsmFFo30Ge2sttHkqZWycIyBUGlfCPdTNFNg6ZAnhOM3iMzGMKav32eNUCz2eEPRE6RE7ewbnwzBYFEbmc4IzcrKluCQK5tSloZ/jhnUjg8ameTZrvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727254399; c=relaxed/simple;
	bh=lS2mOuyvD+68D94i949beyw7D6OBOrn2mI7jILlQEZ0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO9eVLpRZN9wfEMhMVeUhMowaZ3qmLu2z7YlzJEA5rFeo9siT1Uwy3P26qHP68f9X8z7PkJM67cTLKgvkyx8WKndB7kFp8OW+P5smE3Jym38mwIFGuCfHjSUPKYZG+teOGtaS0m9YjRuwqKac3MDNPliYidBlCGUt8ZffmK62Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpDQU6wD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so61678405e9.3;
        Wed, 25 Sep 2024 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727254396; x=1727859196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P166hXmuj+XlKXAFTZIVxMo1jHOSojSxk7n9xeXkzbk=;
        b=GpDQU6wDhubCzv1Ki+H5gm2pM9TeKx0EESXS+5BnNRNyIQOVyHlyxTJAe2BZNzRdFd
         15jXbIXQQd9tDa6gFcOQtTxvd7AiCdjw7kx5CKLUoKT/5pAsyyHldebt04pzgiF/cq/Q
         LJiw2Lf8lZJ7zGrKuGTMXQxhnCVZG7B+PDX5E3jTVVYVwPgm7qr6gdiKhJy9cbsBzXMd
         kr8JWafx9F6RZQedvzlMVoYlcFQVeaVzfJiW5QcE2iQ64CklRxB267F3R7xN0l3AeAPA
         HdSIf/9sR3y/JBJWsYlH9ThH2cWTeVxiEf1DsCyzXVrC9o5KQadsAO3JP8c5uQOTwBp7
         uieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254396; x=1727859196;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P166hXmuj+XlKXAFTZIVxMo1jHOSojSxk7n9xeXkzbk=;
        b=kz3/WBzcXLLLo1255yt+z8wEnb4Uq8VZ3x1S9PJiNM7SevKKQOYWk1TXTrfo7mvLSk
         thkeQ7h+tAGmcMqtnlYXFNBUStYNNnuspWnus0m1grMf0ybYdAVmkxs096KDOCMLyv8J
         JvERhVUlOEolURkFp3by6/XfipBGG0X+8YstradeOufXUe/iO6kTYr3b1dkPjgREY4nN
         fAZn7KSQ00GNNsxyS8uJkQ+W9MoMOrbzCrb/U0LCtYpi9SD8nmolWe/le+ldqoasZrqt
         5bGWZ+pJNCSMjHiky8/kpyVGALxhpPpfLr65vudpnG4TC6oZiu9ndV5lz8BgtuRX9sGW
         28ag==
X-Forwarded-Encrypted: i=1; AJvYcCVLe+mDXJc4gCxz+8FYsxhqT7gDs47GEkcW0dQS8Eaibyb/buF8NCRn2AGX2JXsWkMqHwEk2b0FrjVU25VV@vger.kernel.org, AJvYcCVZD8T3hI9oaAvfn+Yt5hQJWGes6r/NMBC4A+Zw5fDJIN3kCcoWdU4vNobxfHOpUolSQkf6OJIrStGLpm7RvHs=@vger.kernel.org, AJvYcCW/ozOYFlE9E8X/c3Qh+91mBwVdCje2iFVBj9GfZqzbb7NwRgt4B3e/Y2ACprdArKAx7FWvCniJKr7R@vger.kernel.org
X-Gm-Message-State: AOJu0YwCmW/z/1b630WFd2YjffdDdvklVL8nfnF5ZePsE+E8XkKxQG/e
	LEq8GB008zurVAD+jbLDVUuws4ecKRtQfagwTWkXDw8FjNWNRIDsf9pLTQ3C
X-Google-Smtp-Source: AGHT+IEcVaSpSj2zEv6r7eOz7mIfzbfgPFam7Wk1O1HspoGRGC11248azZoJkdLpoSoLf8SZCyuaqQ==
X-Received: by 2002:a05:600c:3c85:b0:42c:df54:1908 with SMTP id 5b1f17b1804b1-42e96114ad3mr11248695e9.18.1727254395949;
        Wed, 25 Sep 2024 01:53:15 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a09a3fsm11550325e9.25.2024.09.25.01.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:53:15 -0700 (PDT)
Message-ID: <66f3cf7b.050a0220.3af9f1.2fe0@mx.google.com>
X-Google-Original-Message-ID: <ZvPPd1F4vV6novEg@Ansuel-XPS.>
Date: Wed, 25 Sep 2024 10:53:11 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>, upstream@airoha.com
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: airoha: document watchdog for
 Airoha EN7581
References: <20240919122759.10456-1-ansuelsmth@gmail.com>
 <08288a0b-3e10-4f83-8bc7-0587328ee9a0@kernel.org>
 <66ec1ba3.050a0220.2c6214.5dd4@mx.google.com>
 <06f11844-2b85-469d-8729-a8757a566814@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06f11844-2b85-469d-8729-a8757a566814@kernel.org>

On Thu, Sep 19, 2024 at 02:42:33PM +0200, Krzysztof Kozlowski wrote:
> On 19/09/2024 14:39, Christian Marangi wrote:
> > On Thu, Sep 19, 2024 at 02:35:02PM +0200, Krzysztof Kozlowski wrote:
> >> On 19/09/2024 14:26, Christian Marangi wrote:
> >>> Document watchdog for Airoha EN7581. This SoC implement a simple
> >>> watchdog that supports a max timeout of 28 seconds.
> >>>
> >>> The watchdog ticks on half the BUS clock and require the BUS frequency
> >>> to be provided.
> >>
> >> Clock provider should implement clk_get_rate()...
> >>
> > 
> > The BUS clock is internal and not exposed to the system hence
> > clk_get_rate is not possible saddly.
> > 
> >>>
> >>
> >> ...
> >>
> >>> +maintainers:
> >>> +  - Christian Marangi <ansuelsmth@gmail.com>
> >>> +
> >>> +allOf:
> >>> +  - $ref: watchdog.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: airoha,en7581-wdt
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clock-frequency:
> >>> +    description: BUS frequency in Hz (timer ticks at half the BUS freq)
> >>> +    const: 300000000
> >>
> >> Which bus frequency? Aren't you missing here clock input?
> > 
> > I'm putting here property to describe the internal clock to what the
> > watchdog is attached. Should I drop this and just hardcode it
> > internally to the driver or maybe declare the clock to be 150000000
> > directly?
> 
> If this stays, then please mention "internal watchdog bus frequency".
> 
> If this is internal and it is part of an SoC (so not board!) why would
> we need it in DT? I would imagine this is fixed per SoC, thus deduced
> from the compatible.
> 
> clock-frequency property is legacy and in general discouraged. This
> might be an exception, but for that I would like to see more of
> explanations.
>

Ok it took a while but finally I got my answer. The Documentation had a
mistake and conflicting info. (one bus was said running at 250Mhz instead
of 300Mhz) With this error fixed I can correctly attach a clock and drop
this stupiud thing. Win-Win for everyone!

> > 
> > Tick frequency is already not well defined so I tought it was a good
> > idea to describe it in DT.
> > 
> 

-- 
	Ansuel

