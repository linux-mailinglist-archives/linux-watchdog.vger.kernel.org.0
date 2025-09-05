Return-Path: <linux-watchdog+bounces-4206-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0092B45BA3
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 17:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED5A07B9125
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 15:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39AE2FB0B2;
	Fri,  5 Sep 2025 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItcMRHAB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C162FB0A8;
	Fri,  5 Sep 2025 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084559; cv=none; b=NRGY9iWm9aBHeWAeSawrmmpxrzp6pJ7rUL/YfVfKnzLOMQWcQoUuMCoaWp3h+yEFXmqw5IaC7jF3zvrtixJsmF2jaRhJFIqiPWsy1+qejyuz7Ol1LagaHjY1BWYRVpSZR3UGwmqqzo4pCmIJJ+R62U/SSeKuphEvMHxQSqGYtZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084559; c=relaxed/simple;
	bh=SV/uSJSAnJnN0O8ZhM5BN/MzfL+AMIQqys6mRrI0IUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4QH74GJm0piAPqBTOyNPFEATo2zRRn7n8G16IfKKTZYOuBVZT+hJVX+I5U69q5HU40QGgymOrc718wVdLZIjqIhklvFiTPfLCXt6KMp2ayklDumWKvnm3A5l1kinBhFTsWLWXr7JeH+5USPyJPSuJrxBNaxEUA3XRaqOZSiTlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItcMRHAB; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso1459110a12.0;
        Fri, 05 Sep 2025 08:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757084557; x=1757689357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Iyfq6Rc3M6L0n/jhYOE8/JhQfgkrj0ZVobkNN46EyM4=;
        b=ItcMRHABxY9K1PjCP0Emg93sUzMJ76NNp6ke5puMAxUnkVZlTziXCozrMKuaJbIOmt
         9ZQuxt3DeSCryxObKX10/vdMROYMUFhXa9Yzmhe1vp6KCpvQz7QVXowmpL0qr3VgJzeT
         ThfMoIaJev/uylxJpys4cdXz2THwgjFIHUc4SweILvRn3OUKZXpnszs4z5JLCx3X9lOo
         pkHBNZdHIM5/NriAKLekAeI5nDUlfE9X40j9uVinw+6Q+vLFeaUFhR92+s9Oj3G3wfPT
         QufXmo4Bebjy/bBV+XiK+v9PoNWo9mtsZd/cu6pcxhS7CZTseszBZfbYZU9OcZ0N+wjp
         KG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084557; x=1757689357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iyfq6Rc3M6L0n/jhYOE8/JhQfgkrj0ZVobkNN46EyM4=;
        b=UrW1qonLCFzcmly5+7+4XCgA1XgH1PpYFFsn8jTp/LaT0GFZGf8FDbpdugg8TQZDY9
         WHnIqj9mZxAOOQXC33TwrkjqgS6ygNzeIDwcOaiKsJeyP9xMLtiL9xLydZiykzDvNoI5
         g/E1JRK9+651mGneJzCTIl+E0rRWuyjgBhE5LakZ6IpxL3fpgSJXydk1bwPq/Ab/9DIi
         wP4NLD4AVYTyW1/XifxOSJrOfSe0Gayj9HRhD12PVJlyrswzIWBBb2/ErIHwCVVK5l7N
         RtdL2sJ7xUI4w67U0iL30+jll3drLF4scB/+9qKd5JpVaaKpn/vH7VmncmRHOXf4TEDE
         ktrg==
X-Forwarded-Encrypted: i=1; AJvYcCUmchwgr2YCTUgRefCvclleFiwX3YKFFy0NF3+MgCU3FsQA754Q6FTinwe4dZjEl520ZufLV5mXNkEIHyKGXQGk+KY=@vger.kernel.org, AJvYcCVrQvhv3X637MWTZvoaKzB1gjZMtc1SGSjopJ7FndvxnfZ/6sgCuvyOoynxSexWFNr1JfD+RrJiUG3ZZxzj@vger.kernel.org, AJvYcCXi2zab0vfesme73jUwMGUDc94cvP7HPuPKe7msoVMtPKsFw2j/GWhCPW4h/WD0Ei5/l90mHm7pl1YP@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPm3gSGA4ZuPOSWfZ00xN+mR2rAoOrtmMGPWvo5wgFZOTEjrg
	9ppbWK5EOS7OiQ2uUXgFhwc0jI4V7VhafVyQ/D1/H+moRblnG2evX1xD
X-Gm-Gg: ASbGncuduy/ESjQ9HnHLH2495jMHvPAOFI3BKICZsSx9i4yDsDSa0RgTwAdqzNdl6EP
	MjZcEvWlJb498GHIHR+VKylaEv5q10r2UU+eT99MNJmgyxi1wpUvR8oHlHfp9u8I2loMPFAmSlP
	AIoU7d4YUHcc/Gx7qCysPC+sgoNVwgiUTQx5shZguRE66sOc3cYnzj6vw+lDZPRL6lQrhAGDsfL
	N1KG6nwrUFlXX8vFEyURpn9eGq4JY19BwrDJ1DyMbNyVruDdriPBH6bo6ZaWq+QbLc4Uy69Sjc+
	u1ByQJN7w/4C+YoYkDOkWWKL4B8nNx2/TUSHwMnYooKg/Cr2AhKSpvfxMjU2f7Je6PlbrEa9pdz
	/iF84gZBGb8ZKmprM3c2/P7dFKE2Neewbh68dmXdplm1VXxAIt83zZhTj3eVSRb97EhzpGF4=
X-Google-Smtp-Source: AGHT+IHRL3xwlyFDJAlvY4dcnk1fhydvNnnfxChZhso1KhvSXqtgNOxI+PY1QLR7ctUyr8T6Ru9oFA==
X-Received: by 2002:a17:90b:2689:b0:327:e0c7:1e63 with SMTP id 98e67ed59e1d1-328154373afmr30523984a91.14.1757084527174;
        Fri, 05 Sep 2025 08:02:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4e5684da06sm16482808a12.17.2025.09.05.08.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 08:02:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <947a6ca2-a1fa-44f8-a114-1737e475b4ce@roeck-us.net>
Date: Fri, 5 Sep 2025 08:02:05 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] watchdog: rzv2h: Improve error strings and add
 newlines
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250804195723.3963524-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250804195723.3963524-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/25 12:57, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update rzv2h_wdt_probe() to provide clearer error strings when retrieving
> the pclk, oscclk, and reset controller, and append missing newline
> characters to dev_err_probe() and dev_warn() calls for proper log
> formatting.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

