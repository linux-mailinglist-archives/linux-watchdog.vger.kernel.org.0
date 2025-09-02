Return-Path: <linux-watchdog+bounces-4150-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD5B40D94
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 21:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C247189DA34
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 19:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCC7350852;
	Tue,  2 Sep 2025 19:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIMSXcQN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3554334F494;
	Tue,  2 Sep 2025 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839931; cv=none; b=TS23gf2P3j/AtXz3nU9ackFOZ6pB01erTi9s9Ff70TFYhDRnPOrMENlERUgDlXQKeug3ifC1fAEjSlnethD6Lh5VJDSA7Ni1LEW/7Uhhp2pFufhrQbvK2rjbVVg5Xa1DKmI9nRG0O0nlfoyQ2f7F/0jA0ihxbCYTd/IZW6r5Ebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839931; c=relaxed/simple;
	bh=8ZoV4ORWJkMMl2il59701C4IzAmb4HD6In7t+as8lUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD5J0fFkG27CA6rkA3xpzdhRT085NW1FryIqnn6WyM8us8G9UwcaB2NMPusK3sKHwT9y/XeCR++Ii5C7ouMqKjb4WRXsp1RVjbmRnUWiqkjN/87n/Jm6TmrXkmvhgOZGf8j6ORScrAzeL3WogYLCgFku6EGwkeZGmfwMa3lGoL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIMSXcQN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445805aa2eso57620485ad.1;
        Tue, 02 Sep 2025 12:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839928; x=1757444728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78JjK4tXcA8g9uPjMvbbjnVHA1m2U/+rqmg+Iy3ERTE=;
        b=BIMSXcQNpYD2HDVxrSPTBuwluB1fsr4DVcOKkccrSjXOjvBCx6SQVfsPsGjRhzpJYf
         mWyBbLmsJm0PQOT/b+GDVFB3BtwfXme2ROGVVEnPwoMkvyPICbj7EDcPx/9GI8H6/lDg
         x0oc+exa4lZyxMjzKtU0E9thABlcd6fc2kauN5sUOtGZgwqlrhpugad0vHjTTlJ4BsjX
         W5UQD0i/DnmCd4cMLuYYyty2hkvW1oqT5EZ7927WN4JiJTwNZc7+uv1TWJUw/opoWUPo
         Ov1S/cDE7sCMe+ZkIqZ7vwEq+NWbfA+N/59Kq8FckbPM27AVYLob3aM89lq7hpw+SOkJ
         /QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839928; x=1757444728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78JjK4tXcA8g9uPjMvbbjnVHA1m2U/+rqmg+Iy3ERTE=;
        b=HSaVUa14BHvTNmkIocToXsxuUPXi2CbP9+ABf6UWyNsNJ5rKvrfb34THfSyLuacP4s
         jyi2d5TZKqtiEWWO4f5vYiSuxr7KfpRIt61kvUpk/D2An9VP6uy0VKXSv4i3KZst9QDg
         Vm5l9tuRx92wMpCXqoVGlvyj5/ZTgkqMz6Hyf6GLpEk+Sz/KIXZPKOmmo5LXzYkpz7b9
         AOllFA5cxK5/6BECVGXI0+fLZ8x7rspgjT8p9fadH6RSjwTF7c5Wfo9BmtmU3ef6rU3N
         7NG7zwN5al86fEIzSj15uhCOH82C8GwOjwYXeT53gileFa1qGFX3herBBQ8sahef9xfT
         dYRA==
X-Forwarded-Encrypted: i=1; AJvYcCWBMo2z6Br8q8dnzTWn0v5/YdcbWNj6f6BYThkhEBx7m6GA75D7OL3IGJHFAKwPaoVsG9GX4Fgc5wwx@vger.kernel.org, AJvYcCWd6STaQdJea5ifXRNFhKEdG7BPLpUVkGvU51JpTKBmNAXTqRKuCmn5JiUxME3kCog63haGSwyfAeLGmn4AfVU=@vger.kernel.org, AJvYcCXg4OgvbPf4FbT0EYoK7WUMjJYpAoed/MPTa5qFucpfWjBA5vOFrHD5UiD8YOyjCKVx8L13R0ovgYLthW1O@vger.kernel.org, AJvYcCXkBLaV8OsSEUrirsT0FpX2V6ztCysWNZwYLDPUEodISPxF9oRjOVE0oxsAjAbSE7lgF5nMVBLD/SH58l2MTM92Ft0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrKDjenmUg8fLMIN644T832wBc56DK4j52EAuNwCzMV2I8J3z
	TrvZo4v7dtnK8gtMIWpl9RDXGa/L7AGa4R2cttS2llA4CeextX+zXeCF
X-Gm-Gg: ASbGnctYJt0oiNPKfk9E5cdiDethgVhJtZjMMVP9iNF8+157fpl37W7tC4+kYCwXZoi
	71fEGqS6yIlX/DE+osWRSoFgDe7QzB49tuVzn/MHZ43m92pVWABI40Hmx2o7Px6Mz3rxFCkDQCR
	NHkmspz+VUP+U5tx6nVlzPdN0M8KV+MtXeuuXyW1LI7IBZ3WVvUkaHBrumME8/m9g7+hCPNpF6m
	ekaEbJs/RYwlNaoXdEYuucEAKHhjdCFeM4alRY+t3dxojM1w5YVR2nKw0tJWoItw+I4e8e7Rhjy
	SsLVRijmuauyln8v7TNHP3ZH69V+fwW4ZL11G5GSa9IQMZzlR/0ZktmPB2ca+tABqf/8e4yG97K
	sw8rr5aZ6LBIbkyuuqZJpQxg6Hic1ztR6YTqa65AzOphvvw==
X-Google-Smtp-Source: AGHT+IEGvSjCtN2tazfJOvk7JjCLXCOhTbAtGkB2W3n5ns9Jne3onIDumA+e7R7UQzVPVwR1WktAOw==
X-Received: by 2002:a17:903:2f8a:b0:24a:e25d:c70d with SMTP id d9443c01a7336-24ae25dca0emr91663435ad.48.1756839928286;
        Tue, 02 Sep 2025 12:05:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ed87sm15053668a91.23.2025.09.02.12.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:05:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 2 Sep 2025 12:05:26 -0700
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
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
Message-ID: <8b935f78-99dc-4857-bb5b-2a1636103772@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>

On Sat, Aug 30, 2025 at 12:18:57PM +0200, Krzysztof Kozlowski wrote:
> Properties should be always constrained in top-level part of the
> bindings, so move the samsung,cluster-index constrain from if: block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

