Return-Path: <linux-watchdog+bounces-1414-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23251938FD5
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 15:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2D5C2818DB
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 13:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028FC16D4F1;
	Mon, 22 Jul 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToT9WMcc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5016C86C;
	Mon, 22 Jul 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721654527; cv=none; b=OsjIZB8C/ujGuBvxgtOcGkCC2rrrpldC2ntEbzqwlUCyMzbyXZpLm3bXi7lVOvI/d8c7zyvNTkOaZZMivMC6ETB8b7RtF1t79oZpm6DqfzxDdJhsBDOH+Kt0bX2jwOKz0oXmkYfvwdogezm5Bp/3UaGsQ+QjAH6SE4lgZRkeRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721654527; c=relaxed/simple;
	bh=2vKEJzscwHyht/Mj+S5ofKzzAu2yuX1uWIAN+34Sb+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb+AvedyrPpsaqq+Gf36QkIDltiv728CNJWwjBga1cf0mxKlbqOjtsYBLenJiTU33GoLe9KcScJsgDkf0Og3IZRFmheEqiUm3J2C8f5iQfmvm1kpCVS01TVpSqG7p+NbxnxI0kvoCgvPNUAxjM58Pdt53nhyCMLuWDHzB8mAuoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToT9WMcc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc60c3ead4so27411855ad.0;
        Mon, 22 Jul 2024 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721654526; x=1722259326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91FbeKCro/R9xooEsAtamHEIJSQp8ZoMEoqHQanpP2A=;
        b=ToT9WMccu5BFxeH1XBoc2iMz/dzfeoMtiDHa90RxoFKWmWNXg1C3UKSsfiG7UUAV8l
         mZ0tzkI8L9+r00ZtTgilyFZ6XP8LMEGVd6dLKmwPk0i6hp+YgTIHGAWZK71uVU7HBnk/
         vla4tpUurYOZW7LExyQ1DJXulKMydIcNr7fn5ws46dykjncXEc+MAe0LsmSKl7mYh5yi
         3w55xchCdJpBJ8LiymFv96T+Q2n/dE9Ug4su9/gZrkaKZcczyaG+NiY1D7jIL2ZlPLT/
         aB3hqlZxusUVzLFQhVEMvfqg6MLlBObhG6H4FnkFPWa8OjiJ0qdqv8CXtegxFp2DjZo/
         xBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721654526; x=1722259326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91FbeKCro/R9xooEsAtamHEIJSQp8ZoMEoqHQanpP2A=;
        b=O/1yXqkl/HqfKt4iadSla1zpfAmEX8/q423ZPpO3k6AeDqssVRvcO4946/F4n9u1CI
         Kc4U4PQnN/RJEgwcq5fG3SWSZwgzqFv2Kf06Pzx89qzOqwU5PA4Gx1kPx367jWOTGk/f
         FcK57WKDLq4XC545fvI1NXs5eNctLqCUEoTg2pOD0EkgMpuSt0tUiB4pAPDqAm8Imswc
         Az4YbDH+lXHSiYDUKiNaqjk+5+NHYusZpaj9ha3TShHZ9denXy5/sHOLx53Rc6APOJHd
         +r3Z7UclCyrr2VYP11OcU78OdoJgjuhDD6QxjJXD53aWNrlJQCgHYjValKECAGyazSZ/
         pmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV615+O/1ruoWGJRM2ASN77G9cyygaO6vElNa7FkkhmKzinE7Zq7dIwid0LLRYuq6yWA2LT7dsEik1HMmSfj9CKbSKmCGQqZz2hSRXIrVwviDqdtWCMyPdY6daPTHEiNIx5IxmAp+UYHBLnSq/4nF8C+iVrZJXXgj4oNJ9Wqske9VbXgvssTSzX
X-Gm-Message-State: AOJu0Yz7pJnGsuWXcPcYVimRinYAdMiupP6WDKJbDxxCGcBSVQhIltzT
	KlglVeb/O32F/kCD6Pql3umzOjXaeuct3RaZJUzvcLkzT4JVyVYNQgpqmWmc
X-Google-Smtp-Source: AGHT+IFfoDVQmkWSwg+Xe9LZsHqnc6RZRM5Jnyw8+XVysBR2jn5lqmn3d11QYNMzzx2IdehF/TkBKQ==
X-Received: by 2002:a17:903:2c8:b0:1fb:7f82:515 with SMTP id d9443c01a7336-1fd7454c2eamr42922365ad.15.1721654525844;
        Mon, 22 Jul 2024 06:22:05 -0700 (PDT)
Received: from five231003 ([2405:201:c006:312d:8653:831a:b06f:a502])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f45498bsm54064785ad.229.2024.07.22.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 06:22:05 -0700 (PDT)
Date: Mon, 22 Jul 2024 18:51:58 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] ARM: dts: davinci, keystone: correct watchdog
 nodenames
Message-ID: <Zp5c9rNyNJwQZ4+k@five231003>
References: <20240721170840.15569-1-five231003@gmail.com>
 <20240721170840.15569-4-five231003@gmail.com>
 <e0e36e05-f565-48ad-9309-854b6fb7985c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0e36e05-f565-48ad-9309-854b6fb7985c@kernel.org>

On Mon, Jul 22, 2024 at 10:13:59AM +0200, Krzysztof Kozlowski wrote:
> On 21/07/2024 18:28, Kousik Sanagavarapu wrote:
> > Using "wdt" instead of "watchdog" for watchdog timer nodes doesn't allow
> > for validation with the corresponding dtschema and gives errors
> >
> > [...]
> >
> That's entirely unrelated patch. Don't mix simple cleanups with patches
> affecting ABI and users. Also, explain why.

Got it.  Will submit v2 as a seperate patch, outside of this series.

Thanks

