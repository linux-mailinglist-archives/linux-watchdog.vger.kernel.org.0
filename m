Return-Path: <linux-watchdog+bounces-1968-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8E997C960
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 14:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2FF52844BE
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 12:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC58C19DF8D;
	Thu, 19 Sep 2024 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAPLVwzP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3982B19DF53;
	Thu, 19 Sep 2024 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726749607; cv=none; b=OEXsNhYG4VM/Qandvyrj17L0+Ikjvr1IHT7vaoO7893O1BHQ6DHPV9WFC9MDA4j1KuxcPAlG0zguKqDOEJRlCQAW1YTjPC+fKL17p65hbvUjqppyLEBxMudMgZrA9AZyjgYAZsK6vNMMjwktjSpnQ/8CetMOGXu4r1g4TZZcmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726749607; c=relaxed/simple;
	bh=7hM5IwxIWVcQkpCkqyPAN3lBWORY+R++mPpPWbteYyk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl4EowWFfxONHivuBN2Rt0+u8YwXzp9DzXO/gQrh9foEqDVve3/QV3xIWQQ63srGSt0pFsn2CbAclyNlasFxYCx0F4mF/MkKPvq8e+yEyIYx4MKN2AFMMaOOcnfXE2y6Cn3bf2KEqP6iclyPfk+UDBuaOTduMxxR5ayF36rugEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAPLVwzP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f75f116d11so8755541fa.1;
        Thu, 19 Sep 2024 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726749604; x=1727354404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ec2PMXOUkfsdcs/oL2kvkQW+d50WPTL2tiu3jRGI1L4=;
        b=DAPLVwzPBXD6bWkteNVlQKm5QebXfpVXvHyX1tRqOg6RysCV/6N4SbEesOvDjLafSD
         Wj8JnLrS/VuC5pMeuGr5PkUY0KxcS8lH0MVH/dwH1IbirYrvZyWrCkD7Fij5VpNa2AuY
         Bi5eis8G15LwI3VViDUb+z+a/3/TOuD20EuclV1cDF7/n7U2HFTKsIuPffqX/HUVjyAv
         S9QVCqrRAYcvJVwOVPygfOF6UWv9HCfBQ3LJBBT3JDK9NMKiDGBV5CPpCABUo8p/ywkK
         oss404O7VUCK9cP+7WnsYfSoPEqvIHaSVX4bQmQns7m+H8s7dGqyELmcGLY8R0kpPmcU
         cjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726749604; x=1727354404;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec2PMXOUkfsdcs/oL2kvkQW+d50WPTL2tiu3jRGI1L4=;
        b=Cb8Zvga1nOxuIhoLn7h8eTOkSN0Ho/OZK/yFQDxqVuiVkuVA/TuAkpzfdG/DOMVEh0
         uRy0HXH3x/vTGvjL6nneexPJt8D47De1KrAPpqXrxImoziIdry2awiPhZNULps9ChH2b
         SMDefuWDgpGBfEnJEthrX45qaSKjI5qnjxt5dGylYxMvzj/U8W+Wtha3FcvtDPDcGlwI
         azCvkhsU2lxFrPJbfef+0XLxPiycx5J8Fu2yka4Qm85qTW7RDdqXbJ4HGrurZSPg6q5j
         0pVp5cz6r1ErmHDTb7K7fmyVTKQQ1AN8gxYKHo5pYOJMje0EtnrZ0KgQb5RckeTnwwkH
         9egA==
X-Forwarded-Encrypted: i=1; AJvYcCUYX4QTbiBNoHTL7V6KEAsuGKmF+lpAMFUxVafaFbmDUtLp/Wv0HVXgFFlH85dyzaXFVTM8iNaCVsXO@vger.kernel.org, AJvYcCWZXif3MLnx1aYCq386nmTWtFyHwAmcym/wDQ1sgEOyDInbrY8jHxOkQ+6a4yyrKdCDO+Gk64g3l3aTedoY@vger.kernel.org, AJvYcCXhpqGW3LD3SqBAtI83+FGq5qlg57cczFvutG61SEib0ZyNI16W1stbBbZS2tWz64D0YiKkU1Z5C4+EmMZ8+g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YydYyyR+VechEaUhxLRgXH8YSQi4c1QqRKSYvOmrJ7wtwiA/iZp
	DkejewnFdQIpMBw7c/+9J/Aywt/EMCnCpr5R3LFL+sllol2OsHGeAJTBVkYl
X-Google-Smtp-Source: AGHT+IH3+FVhZhALnKaeY5afyh+/x/weED266KDJ3Sx9qRtIuvipNscu0eJ6stshOkybbzvtBzJXYw==
X-Received: by 2002:a2e:602:0:b0:2f6:6198:1cfc with SMTP id 38308e7fff4ca-2f791b5c432mr88043081fa.37.1726749603917;
        Thu, 19 Sep 2024 05:40:03 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75468393sm20768085e9.42.2024.09.19.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 05:40:03 -0700 (PDT)
Message-ID: <66ec1ba3.050a0220.2c6214.5dd4@mx.google.com>
X-Google-Original-Message-ID: <Zuwbn3UJ8DPNRliS@Ansuel-XPS.>
Date: Thu, 19 Sep 2024 14:39:59 +0200
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
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08288a0b-3e10-4f83-8bc7-0587328ee9a0@kernel.org>

On Thu, Sep 19, 2024 at 02:35:02PM +0200, Krzysztof Kozlowski wrote:
> On 19/09/2024 14:26, Christian Marangi wrote:
> > Document watchdog for Airoha EN7581. This SoC implement a simple
> > watchdog that supports a max timeout of 28 seconds.
> > 
> > The watchdog ticks on half the BUS clock and require the BUS frequency
> > to be provided.
> 
> Clock provider should implement clk_get_rate()...
>

The BUS clock is internal and not exposed to the system hence
clk_get_rate is not possible saddly.

> > 
> 
> ...
> 
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,en7581-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description: BUS frequency in Hz (timer ticks at half the BUS freq)
> > +    const: 300000000
> 
> Which bus frequency? Aren't you missing here clock input?

I'm putting here property to describe the internal clock to what the
watchdog is attached. Should I drop this and just hardcode it
internally to the driver or maybe declare the clock to be 150000000
directly?

Tick frequency is already not well defined so I tought it was a good
idea to describe it in DT.

-- 
	Ansuel

