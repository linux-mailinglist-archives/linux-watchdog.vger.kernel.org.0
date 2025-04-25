Return-Path: <linux-watchdog+bounces-3391-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BDFA9CA8D
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 15:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 250C31B813E6
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 13:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17E1252286;
	Fri, 25 Apr 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOU+Khpl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981C101DE;
	Fri, 25 Apr 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588305; cv=none; b=der57KdF5UYwcwclauPOull0e1lbgOM5ts2FTv2kVwirwDPStK0dAH0SHu5kEwBVRkZaw/m/DFIIGgudadqdtfvO0qh34z8ENsX3j0SZXJxx4ck3sf3S6XnyckBks+eiZXI97n4PlrgKSeKrf/m30l6VQVHUxG7uaD9zmwRwu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588305; c=relaxed/simple;
	bh=eql/A+0VoqpLXSVZu0IePHu6j73BQUU/xmbRTnd/rgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBBIsW5EfoGBsMOyuyWRHLrWYUZBfv/+ZEY3PcDFc4UTZz9kqznpafpRFPq8ZMNDqBZqvWEjtVK1yoR27v3gXZrmY7c+gsSaNTfR6LmZ4UEYQraHQPc82rv7CS5sxJvQg6HFQB9qgbMpYORGmBm75DU3Vcl6K/3kuntfNMuPbao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOU+Khpl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so281166766b.1;
        Fri, 25 Apr 2025 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588302; x=1746193102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=;
        b=DOU+KhplU67M4ZzYCO1kER1D3hGAZiSZ4t7//PMl/OpmyounmJ6BiSnspEJrbaj9Th
         6X0RnB18OM9yH8uCPGyjR7rCkivL3JsFvTfGgflP0+nMVMHmLdnJjEU+bBkz5VdEun6o
         EJthSWvFU+HVqjQ25alXkt1iDIxG+VtwpoKG7uQJD+ud1E4LNKLYkkdyEVRSvLXdecxl
         KBcWGHi7sEHx5yWdDXObwzUTBbQM+/0EteDQ7LVARSLXli81JzxuTIUGw9w4TlZjelvL
         nZdkRPsCKQ8q4VbbvuTPIs+czc5kyJ2tkzroelLUtvzbNd31MzxWj+JKeaQP75FbI7Bz
         lLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588302; x=1746193102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=;
        b=Aw7XbRfKUhoBpY3d7qcMfH5CCxkwqdqmyhDHCT7Y1S51aaNO4nW2uPzsI2dnxjYPM1
         xTZvqtPIkj0kdM1A9Bdc9Z7pDnMAA4I+pv8YJXPiCavkcfXS/a0NpUH6tJ9cCelTEZH0
         C9f8fteYBogqAvjP8iCBwTpFFY/e5e+X6+ClveuO0fNAYwWFcMT/So1pLubrqVndOU8C
         pS8MPWXmKRXHMSbCUar2j/DDZ5XTtN/QvL+Z7juXDX53Apt+FNWP3RlTk7JEKG+dyPil
         MpIc3CWn9xM6tj808zqMFMtArpBuSRBCwX6VzdwMXPMJA4uV+FQ5nLFosxprGBr/8DnW
         m3fg==
X-Forwarded-Encrypted: i=1; AJvYcCVbC8uufFucUyq9YlC3Y6jDgte3p09bAEUo8Ico4sz4ZblatopcMAMhQo5S4Ya9FGKLzUlO0Ywu0znxDyXFL8E=@vger.kernel.org, AJvYcCWULbDlijwbofB4bU2W1f1esWwT6RLp5W1jnRDup0EOE5H/tFlgaLJe/QDdP94+EVPsQBBRqNEnz1kD2mTa@vger.kernel.org, AJvYcCX1TbrACREO/GJhHO3o7TdMFYHQcsObV9a4paP9VJWDts3WZPlC1HhJazG/5quNLWtDHTCRORGIRw1m@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9s2AStzfl+O4zIctcTAmxsJzITnCgamWYKVWU14N2MzHoXeQS
	SWqB9rDrKvGHVQpch+6pscb5aqfu9eZeD3kdt8X7iyKOSZ9n4y+t
X-Gm-Gg: ASbGncttWQpL43rwDNpkZI/vxUNFAWasSGxW99KvrLQI//X0bYZwUHSJHTNlLg+L2K2
	WkkoDNUkK9uLT1NNbvP4VfmmYP5vvS/ePv9EGU760P6ZFrOPz+oQluc0yNdSvMg2QjTrEkaNYKh
	GKhNCDU5/R/y3PktJBNljhwIsV0PaYp4SOv3HyqmfdVEP5zzBAJftnihRSKjDnH7CoIMl6v1swC
	+fKXghuN4+dEsJcrY+lmKUbfJLarAxob702h+t3URNX52mbRdkJOmaxSHW2Rus3dcEQvoOLbOtV
	xW+vBS8uSAJYDRaXjcbAjG/+TwG+Lt8BwLbo8ONqy4nlu4BVlAdITzw=
X-Google-Smtp-Source: AGHT+IG1oJi+fCaW3nLcNOn339NORpBu1OpVP+r3+z/N3hqTIFh+IGeR/Kz+ryWWUdgqSktDSZIf3w==
X-Received: by 2002:a17:906:730f:b0:acb:88ac:e30f with SMTP id a640c23a62f3a-ace710c6585mr259076066b.20.1745588301955;
        Fri, 25 Apr 2025 06:38:21 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4e7a4fsm142045666b.61.2025.04.25.06.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:38:21 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:11:55 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8qm: add system controller
 watchdog support
Message-ID: <aAuKG-_vk36dK0is@graute-macos>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>

On 14/04/25, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

