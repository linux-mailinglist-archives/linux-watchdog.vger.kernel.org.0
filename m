Return-Path: <linux-watchdog+bounces-4270-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36197B9ACC0
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 18:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA41C189096C
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 16:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D44313286;
	Wed, 24 Sep 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl16a+GB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE52DE6F5
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729633; cv=none; b=uyZHt0HtDIhjoiErRoMwnl/XAuM6/G4L3pbKrVX9iEBR8vTIFWlrbyeJSyu5P+6c6b4CRr0l+pcIYCsNCrchdfqKycIx9NjMyLLhGsl6LT5VhQYXimNyBi1whCQFua3XnnX105Ks+UbSPVRncVKaKyDKS2Vx0P8BCf/e3GIegGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729633; c=relaxed/simple;
	bh=vldrG3DCeNRjE0BlLdRWKYuZIHower+u3hHn+TSIV98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7vZn8xG1Ny0fUXHyTu3K+3qIfV7zPsZVrhimqSzdGH8jrfrhVCsp52WGbGAz60qe5ygWYSVseHRXPlQjC4+oAksjcZ9/z1yO84B2Dep5nge4M8kxTbHLCUjbyXKyqC5qYTc/mkiEblrBfhKtPf/owOowvJ/AmvjWqephp4gTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl16a+GB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-271d1305ad7so52332125ad.2
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729631; x=1759334431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/eQZQr/FlrHFqBmnzi43q5wN7esytT7U9mYDKA0Bws=;
        b=Nl16a+GBe5nIxrowTVguBXGovZeuinGypiJQadH8OBO97ToiNLq1OBnChf9Qi90X9v
         YyZsV/g7ELyU6ykAlJ0haVmY/rJ4nD7dUCKpH0D3fzT52ZwZPgvkRs8OH6v5kAtaGDg3
         iDvJXZ4zTblSptnt6quD8KRVJ9asjEUohc8PddZtnnM8KPdRYTbf381Et5aeA2m8PgxA
         b3aleB9ecDxJgDVPFKpIn4AsDced+fuuaIQZ20DtTXViTfhS+oHj9S5xUSCQsUleF7G5
         Ogrvm+++/htSJMFc+2xm8cz6DrnGXdDJaP+CI9KDiZftgVZi4o13c8WJx2tQ7/I+qTy6
         x70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729631; x=1759334431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/eQZQr/FlrHFqBmnzi43q5wN7esytT7U9mYDKA0Bws=;
        b=mchKVpwbn/zX5cIQi56YtUZfjUzp6139NtbOf1LwZRX2cTWhD24ZB8YZn85ETXyGkc
         dSMG0pdqCQCqxDHi6F/NS0s7FWi6IhHJXZ62wl30vYhGCkRIwWtQROi2ZOrEJZBbxZWg
         L6Uy+JoU4QNE98592TwPdsZWgUYGprkV4Oet9zZrrNYJuDySef7DxmeDYYbHgWkbQJaO
         GfbemmorqxXrbrDS7TCODBoI8wy/BiCqA2IImWS0k0NaHw47a0topvMKvSZ568y6x+kn
         +x5l4d6dHpvG6LDhChO3VuWOOZNEsE5qHA8J2sndnZvaN+ib8KcdndaZydv8wneZQytO
         ieVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzkS5+9da2uKFjN5eS7QQrINlMrFywaEtXKjBWqJij05U6wqChbWiDJxkWuzAf47cu2mpyb8GbpceSbrTilA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHbmmpIuJDEJ7Pnt7j8pPexQH9wv3S+QM+hx/OHd5PII6+TjB
	f4OJtrtF1a72dM0LUJLWJIoY3LN0JAkvpNUQ+akE8Ar9sn1rr0RPiAyy
X-Gm-Gg: ASbGncsb6R3mU9MFhxU2q9bRENhwgw/5ICRz3F9yON5eZ68p9Su2hKlYwx/tQQ410k+
	cVNQx4bb5JaASezKC5Wgv+J8cvm2iVVJV5zJQYHg24L8cAzVJ/3Vb0bLwYSG4flIV0nCshif+H8
	EI8SLis0ugdu4I94qTtr2IiN/lDVAu8oFECGrbawKvALoJWGBO/ziUmAg2xksVol3dHUQtdjPXg
	wz9ylw+5nTajLXtvOdXWhZsDvbyTbb+wroUNZBUv9XLsoLqDEHZ7fv9O4VEHsLJvYQBWWW5UP4B
	m+RbMpPoEfBaEUpQ95UwqOpBE6GeLTZdCy2zgvgG5Qrk1TIKzgkBjQlm+aOgSs8kVdGIw8AN8pJ
	IM1imjdmeuC2Xxq3pXXUb5HOcoZ7XIk1QVec=
X-Google-Smtp-Source: AGHT+IHh6nEKuJB+/U1aI4KfR/nSkf414wZmo0pvYnpISYF821fu02/TzRKwO0iL6xcTPglHzJx6Xw==
X-Received: by 2002:a17:903:1a6f:b0:272:f9c3:31fa with SMTP id d9443c01a7336-27ed49b8e31mr2949535ad.9.1758729629711;
        Wed, 24 Sep 2025 09:00:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053201sm196264675ad.17.2025.09.24.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:00:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 09:00:28 -0700
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
Subject: Re: [PATCH v2 4/7] dt-bindings: hwmon: sl28cpld: add sa67mcu
 compatible
Message-ID: <bffc6119-8623-47a7-aa47-40ffeb6ec09a@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-5-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-5-mwalle@kernel.org>

On Fri, Sep 12, 2025 at 02:07:42PM +0200, Michael Walle wrote:
> The Kontron SMARC-sAM67 module features an on-board house keeping uC.
> It is designed to be compatible with the older sl28cpld implementation,
> but has different sensors, like voltage and temperature monitoring. Add
> a new compatible for that board.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Guenter

