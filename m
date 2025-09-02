Return-Path: <linux-watchdog+bounces-4152-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8DB40D9D
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 21:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F8083A32FD
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 19:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90DB2E1C5C;
	Tue,  2 Sep 2025 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbgnVqoa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543EA2DC354;
	Tue,  2 Sep 2025 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839989; cv=none; b=BVGc2W7c4Av5SsKMidHNcpt70JLIi9yp5MYA+v+OlbLT6mN3w/wJ6Sz8Q/by9x1SB5+c0blbPVayiph9ftzUSw+2aM4FSVU2x7boxC0mlLplpK5EfUXAzmE3Gcc41Uqfs0t2S8AxHa/MiwynM8X/AmMc45QBK6SsS9s3hFLbkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839989; c=relaxed/simple;
	bh=IThNlFWknVkh/4cITRbb6EgSx3Edy8ORobj3XyNBQ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMJopQpRTLnEzUKohl99GNCKoUOckpPKFab93U3SJsMU/AtUFfcKY7mPimBu3vGSFhYdDm1uGPYPBxzYnNRdIIwJNFaY4gWaNpwdEM4ndXE454AHqN5YGpt1UUUX6azqFABKQKIi2UrOlSD9SAs9wWmfFpMYtvHg17lWV5suupA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbgnVqoa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7724fe9b24dso1875559b3a.2;
        Tue, 02 Sep 2025 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839987; x=1757444787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaQKGTXkVR3kYdLDQmwE5JedZ37UBA7jczYx+OJ6aog=;
        b=HbgnVqoaJRC3aQdZI5FhM+jAUhS4Vi3lXOYyLM9apuyBFtgav/X/03oGp6H8kKO8wz
         2I90b+gzOsPpr1kFUv7r7qEUfjent+ftet8STG1jz0RMLwrAmfQZfk5EqTs2xpqbm1dO
         TMTLw1y5+V4Mg//+3FH1yo29PlV2codVHE/jL59VbXZWA54Dh/CIUDBiJyDidqJI+Suf
         w17o8yxOaCz9wSwmNaqn+7sWec1HoAucibW1YszNlYi+QMNW8cf/tQ5cTZzcNp8Z2rZg
         kF2i+tI7FVdhqtrupA1AWDt1VX/HDmE4VGyhGjh1dzHBt9rLeMWJIJsChsKPSLkNlTFd
         UAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839987; x=1757444787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQKGTXkVR3kYdLDQmwE5JedZ37UBA7jczYx+OJ6aog=;
        b=UndRMYIDgElaOIGkWlsIHe805DgN7qGEqZKeOYXt4IEXzmGuy5abyk9kotH+XQK0cJ
         486/T2g/Xu0n+6VmVqiV0ajkglFjlaSFv5+rw0tdFkfLIFPxWe4tt3A3cVdYOerAFUtW
         zlGLXf8w4c/Axq7hbJC+BHSQwPyUdhpF51GwigTVqmNpMtVJels6Uq/x9WIgD+lCiXa6
         bQgfYX2PXB9919b102FAruzMDn79MFQWGlAziJeTd2/ph3MMQwQ+qf/8J9OoWHjw9Yc/
         /zPVpVaLpk2DYi6gx7wBFTFeY3FHvBjmiXUjUbXcfUkuvkI9xa0jsmymagxP0aq+d9YC
         b3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT0PzPhrdW5RMq0M9sho7Vvgf6AHUn5qLiFIzkdehYnmiiRWT/YePZkI+h1qyi9eJfpKbqr5L0QeRzTp4p@vger.kernel.org, AJvYcCXAh5EN8WeC3gAG15OQ9w9sRexupKx50lLkDLM9Lk9qLZMd843uT7wYECRhM2GlEK1utvbN2+5Pdajn@vger.kernel.org, AJvYcCXjaynqZpe/4gOmWf4puZa2/1pbkclsC8H6Y/HMALzBTPqxP5F6aJL9036V/CYWCA4+/J1epKZxWxJRweS4QeQ=@vger.kernel.org, AJvYcCXo4uzh/xzDUQVl/1Ow8oUYWWCilm/VO1T23TU62NRJJDkfoWOpOpVo3r43a1dTzsgQXv/WtudpW3MPqo2LoFhRiPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AtclDeu1n6r/BTLLNokONTAFuVffFJLQ+92U7TzgXy34uwhd
	++G4OTsp86eEebPV21hwmdXIUHDWgxkYKkMQCevBr5x69gRQ/GY6wVqu
X-Gm-Gg: ASbGncsXiItcYCSUp0h3SuL4//4Cnw9sP1oqV/htSQL6dBk/ty57LarPzeHM+a2Swh0
	Uwcrnzy6jcS/rRbuLOJGk0JTgvjtzFXRq4OFFBXO0Ch3LBVilTkhlc7IcQyAV3FdcVLK9YJErLI
	3i8D8cPm3Tn1fExSQY0JjT+e5wTzBC0OyJ/Snh4THXGRRtk3TBn5131Yg1IwaEDQv+q0ZHwSKFH
	4OdWVoS7/vEpZ7xi1wRYioiXL8FzIqKWLfC7hkiHKT6GTuoS2aJyfYl6Z+isQkY7JxEb3ji1XYP
	MWi1RfQIvLEFUcD05FY4Kby308NoYYRrpOSl6mlDhULmeFUfgyl8lnxMB1SSf8V0VgqIwldJBdI
	WL3DgLYmi+m2YzG+k2Knjp6vmxoFvqBjbzB4=
X-Google-Smtp-Source: AGHT+IG1xuBoEV27s4xm16m66fmxKaYCj+mrkdQ1flkuz61fm4ED8TpcpYI7A026pH2YAjozHpIDAA==
X-Received: by 2002:a05:6a00:bd84:b0:771:edda:1b9c with SMTP id d2e1a72fcca58-7723e25de24mr17232403b3a.14.1756839987179;
        Tue, 02 Sep 2025 12:06:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm12639897b3a.79.2025.09.02.12.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:06:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 2 Sep 2025 12:06:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
Message-ID: <5570e45f-5208-4d76-9ec7-351665193616@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>

On Sat, Aug 30, 2025 at 12:18:59PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
> anymore and platform is so old, that there should be no out-of-tree
> users.  If such existed, they would have enough of time to object
> dropping Samsung S3C2410 SoC removal from the kernel (which did not
> happen).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

