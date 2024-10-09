Return-Path: <linux-watchdog+bounces-2150-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D76996DB7
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 16:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C30381C22855
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 14:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CAB19D8AD;
	Wed,  9 Oct 2024 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fO3K7ls4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC5190671
	for <linux-watchdog@vger.kernel.org>; Wed,  9 Oct 2024 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484084; cv=none; b=MBkM26+6nR9wwmhOMPq4axwNgYSdH/PF8Yxjpgxbr4nWRPKcVDmIQSyOp1fCEgKp3AoR4H3nifes1SM6YbXpW2xnl0+OaD7aYsu4PuCY2TEcbiVToDEh4npZcsqUpxNOwui8yuPWZFueluZorpb/HqDfPz5jB/pee+r90M5SMDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484084; c=relaxed/simple;
	bh=23cA1onqzwt1q7lhY9JMGOcwOd3fOLWS2ciwmGet5bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd5rXN9tWhyhaYBP+wSsIaVecWzqtnebrzfrjbQql48ByH/XBovBR0FRWabfkmLx+KrAlGs5ykte5haW6x/3oOg79buZNJijbRCCu+4+TJreTMsvUbKu37Op08if8SuJcQzLeOi7pnQCNIxHNDjMfhpCBLbf5nys2/esdOBdy9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fO3K7ls4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c8a2579d94so8068826a12.0
        for <linux-watchdog@vger.kernel.org>; Wed, 09 Oct 2024 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728484081; x=1729088881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CylJOmagGAkGpdVrMr6+1cW2iaVLREpDJiGPFs09KAk=;
        b=fO3K7ls4i7JsT/TnbFPklx+ss4sTEg5Vamz+C/xNw9i2AWD+LILRtzZSsU8G6q8ICM
         DIAaS70BV0ySeOQjK5gEPIRQOU3b/PeemR5PyEaINKVErU44QDKjKiFR/VontsQIJtxS
         Q49RvF3C16Zc59Lu98D5vx1rSL/R5LZxJLA8c1KSelg8f3oMe2CocktgG4yxAyTPTE5m
         x9BOrrFpfVJgiDtVP4EM5xD6Es8FwvW8Uv2DELaPxlczIUyzYgXwsa3KttttekI1f06m
         8usIaa1UIZcNo9m9ns2K2cTREJkOyXHpk25nnIb4Nlac+VyFShKX6sFOjCYP/wNQPMSN
         +EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484081; x=1729088881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CylJOmagGAkGpdVrMr6+1cW2iaVLREpDJiGPFs09KAk=;
        b=UuL8xEEqpWvs7/yR3xEK7Nzvr+vDSS/Y6UVscvqppYI05/3hkbJ48SplLQzgfvCHK7
         F1KEKgH5wQXtNbnohyGRT+n2V6rgQZSyAyMaxnCgC5nJKqYk4oVfanwUdAImTPL3riXc
         3jbb7UZchzKFOA2JUdhs5ssVkJoEIz6sDtacmhcQbY76bPiTwbUcoTnejNAVdfziM0TA
         HqfY49W2ZgCBaNQHKcVDXhYs25PV1kwg+GUE63rSQYr9/mPu2o41KDwzpi+rdADjztBo
         am6r3vALjv2HyC3t9pXXXpqYM5va1Y5/58bITzQ41ftzFHX7DPe4TBLBHuBv0/lOc/zm
         ul1w==
X-Forwarded-Encrypted: i=1; AJvYcCVjH/Jwf5wK85G+fuBevq+k/O+B+jtDkOcqtAmo7wNIMe1r/+HteU7l0YlTXU0Hux6nSvBccan6+1bAnZSJRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVKIogxYFlkM49yviFEtQJg6RHNOTq6IGO4W8MXCj6lgwwy8p9
	jQyHO9AiUho0u5lw0bRa6zqsAxEFBl8QODurDidgfvt76UJFX8pvLtpvv73K1DE=
X-Google-Smtp-Source: AGHT+IFC2+aNftX1wtcYA5gceGi5A5G0BYMh6bKRimAvEmAv1nnzz79VY6eqA3p/ELTcZ0JDKdD5Pw==
X-Received: by 2002:a05:6402:528a:b0:5c8:84d9:ce26 with SMTP id 4fb4d7f45d1cf-5c91d5c3636mr2060269a12.19.1728484080612;
        Wed, 09 Oct 2024 07:28:00 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c91cd8eadesm1016377a12.12.2024.10.09.07.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 07:28:00 -0700 (PDT)
Date: Wed, 9 Oct 2024 15:27:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <20241009142758.GB16179@aspen.lan>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>

On Tue, Oct 08, 2024 at 06:00:58PM -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
>  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> deleted file mode 100644
> index ff5c921386502..0000000000000
> --- a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Zodiac Inflight Innovations RAVE Supervisory Processor Backlight Bindings
> -
> -RAVE SP backlight device is a "MFD cell" device corresponding to
> -backlight functionality of RAVE Supervisory Processor. It is expected
> -that its Device Tree node is specified as a child of the node
> -corresponding to the parent RAVE SP device (as documented in
> -Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
> -
> -Required properties:
> -
> -- compatible: Should be "zii,rave-sp-backlight"
> -
> -Example:
> -
> -	rave-sp {
> -		compatible = "zii,rave-sp-rdu1";
> -		current-speed = <38400>;
> -
> -		backlight {
> -			compatible = "zii,rave-sp-backlight";
> -		};
> -	}
> -
> diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> new file mode 100644
> index 0000000000000..fe9dba8231bf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/zii,rave-sp-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Zodiac Inflight Innovations RAVE Supervisory Processor Backlight
> +
> +maintainers:
> +  - Lee Jones <lee@kernel.org>

How did you arrive at this maintainer list?

It's not the usual backlight group and it also doesn't match the
maintainer for the mfd bindings.


Daniel.

