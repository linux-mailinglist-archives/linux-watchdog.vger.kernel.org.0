Return-Path: <linux-watchdog+bounces-3390-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DEA9CA8B
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 15:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C1A16D310
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 13:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3353924A061;
	Fri, 25 Apr 2025 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqO2AdB4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFEA2701D7;
	Fri, 25 Apr 2025 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588296; cv=none; b=teZUwb8yoWoz4PNhZR33Ib836V0Im0hd9XpFcnGZCCoZItyuNYQhQjtqBzm7aolKEPjfrzpNijJOvR5RMjrkJ1y+06M/+CrIHvAcQdz9qE4E4o/m/93H6cmdrY7fQge5qdy/MGH0YTPbpW3ajvRQY3rJpQKOiWSbLZxKDGlk36g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588296; c=relaxed/simple;
	bh=05Eptw7UL31YEj9IqzW0QE08a3m874ePycrJ0nzwhws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh6WKRJsmV6/SWguAvovqp7MzjlstANyytNhzCOYXdfhHg7AMrAJHBybPkGVR2eYIPk16VAKvbHDSLGLATgAawG+MD/2NASMdoxe5v0v+SU5gXjduC57/uaP5n928lV6GPWx3Wow9HUoJaC7l23dKju4P3xHICxVlcT6g/cWpt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqO2AdB4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso3650465a12.1;
        Fri, 25 Apr 2025 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588292; x=1746193092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqiCINUAAonn0m4tpf2qCa2aEvL6DZ5ftKVEWyb5ynM=;
        b=JqO2AdB4f5LD/0A+5LDorRXRCN7ilznvZkePS35/Qe7LYdGsvCeZELi1Tdj1fCj3X9
         O8/lPjyIFcKfrMgQvLaJR089rqvbczIfdGKLTGwifTlDWXkZV5an0ZKC7RfyhD8derXf
         dYLJtvAYqHC8/9V0p0CA5ZjNGQUQHxeIHyO61dN1LdnX2oxxSeUyy4vE4NiLoqj9UeJ7
         jnXhGLwz1WHeCBFcoTYx6A4mSI6zb+op2r9Nn2ZQspB1WDfKh+hqjO+xr5guUxQV0nr+
         3lbxpgZ2uPyAvzz0H2TjRqVsQzm9oEddJHrcTfjmgDK+Um13GevfrNCW4r5ZwspUAsHe
         Z/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588292; x=1746193092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqiCINUAAonn0m4tpf2qCa2aEvL6DZ5ftKVEWyb5ynM=;
        b=r5+3YZMFX/WTQ4ckY+0yzoH0K5MbpOAsXzQheXiJ+Ya5oKkdjRV38gYPjpQe10RRSC
         nBQXC2ydrt+sIDfVtT+NZiQoK7X0B1ul0GBudx246AS5649bHARFybl4Jj2hiP0rqhhY
         giMwGpSz3LQVlRQv4HxY7uTKoE4O8nw9VKs81EoBnwnzxgdqHAWpCMmsZq3j6EuI0X68
         0Z7g4w5RmnMHMcgVmQDvujfQRko98y4e10xXiZa+dUwCXeAEzPj+EzrVlT5YgMhlehkW
         nAbpzYEzvMe4Fb0O6wP/TiSCAcy55ClFcEMUyTMGwqDeqpGpkgtFAPXv/m5sp9URMVLE
         zdPA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEDyoF+OY77cIDtz4iYFVfJGYx68v4qUYoEu1sXXo9AFQZd3TlsF3IkoD7QCWVA4ezCK1BjPKAQq23rP5@vger.kernel.org, AJvYcCW6UWlO91bN7Bcy7FPhXTur1yCB8QamIpK9jkaace/xfIHt4x4evUPgelBy0xtSSqpET/2ApA5LoR4n4zNAULg=@vger.kernel.org, AJvYcCXCHZNpiNwRBhZD0InUpefdjvNCHSaHxKs0UXWibh/MZQ8SEuIkXNgZRf+t0wOcV/lKH7WAmBDXLmOy@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLH9WwTHGzORnUwWmfKcfVKOvaRdK8NVL42KM4zve5ejmTvbv
	offVnMeC4o+myzv4hPeZTT4kEtW8TmMnHdqZiT82QSeMJKxoWzob
X-Gm-Gg: ASbGncu9iCzmD/TD+lP2SawHTWvDTCB7WjbIN7LaWO0qvAAsPgMEiZE1tWLhT4h5rfx
	hcqVYyZH08h/ZzWIUtg6ICMRfVEy6wLFmeqpe+84qV5Rb6O3etOQJlVyS1aBg8xHQ/Cjy71gCoL
	Cbcpmqehv81jWu8MCbrI0fR/IOqih3zXGE91imrZIThPG6opSR+ql15MOvMnDBMzoYVRK6aQmGW
	QTgt/fN5/0SnJ4vJ9J3wAnqw4M/LmtgDH9WDgc//H+mQa3jIZQeomSlE/tXFRyxotlvWcspc5bi
	qqXubmGMfbwSqVgGyrKx+b0XeAsMkWO34pm9bFSHAiSKPadEuv0/LI8=
X-Google-Smtp-Source: AGHT+IE86Q3+wVqPZufqaFdR5AXK2Hpei01lx1jufnMmv4wt1krtWH2mQQ/n9CHFPIgL61um5nK+HQ==
X-Received: by 2002:a05:6402:2748:b0:5e7:88d8:30a6 with SMTP id 4fb4d7f45d1cf-5f72297c525mr2124920a12.20.1745588292119;
        Fri, 25 Apr 2025 06:38:12 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f70110791bsm1297259a12.13.2025.04.25.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:38:11 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:11:22 +0200
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
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document
 imx8qm
Message-ID: <aAuJ-qg7ZjZj0LQQ@graute-macos>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>

On 14/04/25, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

