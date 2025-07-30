Return-Path: <linux-watchdog+bounces-3928-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B4B165DF
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Jul 2025 19:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315311AA4F1E
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Jul 2025 17:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1004E2E11A6;
	Wed, 30 Jul 2025 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kepa51Ax"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC111E008B
	for <linux-watchdog@vger.kernel.org>; Wed, 30 Jul 2025 17:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898191; cv=none; b=bFxFWyip4qShqxgp42IRJzE9GYcXpCpum3Zec6SKB/cx/BU9tVEdu0upvjSPjbqp+9CI7Ktb+38kDqosiZdSebxFwIuCQiyY0X9Rl98jsmROinVXgwix1mXoVCV2uStAjSlPYnmekZp1Ou8qSgyPBknz8nD3mLwhBdzOAoOkd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898191; c=relaxed/simple;
	bh=6rPHrmcwb5TqA3hsC1dwN8m+7sPVOMr4uFlfIusDKZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyT22KtSu1j5nnSnM155vM+Fhl4lpdhwPideuejn2M6VLDrndomuJUT8KALe/s4tfLEcpHDpMrlyOn1fAjF1rmXESDA5WgeFVBTVoGBNSHY7ROiIkYfkPqUGFqwxlntxYVaRlAQYJpsYPnIhJKdg0OqxJQfW6BB0L2glgZsiobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kepa51Ax; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bc61152d8so72529b3a.2
        for <linux-watchdog@vger.kernel.org>; Wed, 30 Jul 2025 10:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753898188; x=1754502988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZmTbCFsVlsA5ahM668OPziNIEaDp1NqTcL3UK1N10Y=;
        b=Kepa51AxC9h4yKk+6oczaS7Kn6qLHdmiKXrZHFI3sz2DgOlLkiTe1+mFBqVKgWjkab
         ExwPofOT4a4t+EWa6Zzf/1mlerkcA/LgBg+gJQrK3gxljrh57q+2KaQIaBboEQw0sgAz
         r8qqKulECe75f5r6C2yw+g1s21PAh+y/SA/dXhKJ/e6fmFJyGssrX3oOZPSHgWp8aD6+
         9o2DwfKtJlJDDvrEWMXPTxuH4QxdswJ9eSkSWouU2LS9qpPzWbnRYNiSA869G0231XP9
         juKRS2L/0GfyfqU649I+dv3p5sX1/hGqDHTemXeYTBSnX1wlsErsOtxvasXrI7AJE6Rm
         5OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753898188; x=1754502988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZmTbCFsVlsA5ahM668OPziNIEaDp1NqTcL3UK1N10Y=;
        b=uhX1xh13mAaVVRyiy5eJDkNUoNpcKCYCrYIi8Oz6tpM2/fKWooMf6gdIMB6Fv1F8dz
         GrfQ2sq0mGRuHrbFJU7W2myNHwIuYeoYKea/U+XfWy8wt9uop++zauTNDLY/x4xH2k6v
         4cNrAX+lxzTCDD6EmCYtra3Eal3dDjH1AdoZePveVwGSJsFkfaXsGzD+AuxbXcFprBtZ
         ItipmLlQJVZoPfIYp0ANoyHylp5ojMzPZzTDflI2Cm2OuLkFbzX/UEfhcuDI3gyuEX6R
         kRhL1MhjtlxoZA/jNGCtu295g4JgToLxSsp/t3QdnDrjWx9mViGzElp7q0Z2eB4ZMyeR
         b20w==
X-Gm-Message-State: AOJu0YxxDZX2oQ0/Z9guhZ1PbWd34yuy71Z3scg5yPeUpHZHEyoa0TH5
	fMTt+4k14eyuN0i7F8hXL79TFHz4efYYGTBBioKKldLUxK5gWRopG1DkoA1xtA==
X-Gm-Gg: ASbGnctLSn+0xwglV7mBG6uFFjkBZdN3OwJjGS7uBFCNwf1c5Bn0Kg8g+FbDfnX9f8v
	6FwktKyLIeqCHMPgJgEXNLNKr7zhNu4As1OI3xomrHGPZV6vIQItFXm5+aZ+l0hbh2t3NyriKBv
	qevIGc5iSEH/41LMMR2gmRY9kGALw06xJJhTweanyAh7x39ttHf+1cVCj6IUjf3SIptEFRkK7fe
	bb20CodlajFyhRG4jA5G+7xHmHJO8RelD8YKx8l2vtgc2XPX2rh8ixEw2zXiN9pTqjx5UvOkV4l
	i1x/maoKNDys8v/18g3egckSbBF17sb1uhT8ey6HKW94MCqRO61wygp+A0eZWhw05HDYDje6CCv
	6X+6kycNavZyzbV29JZh33WYAfEIY7Y4hlGE=
X-Google-Smtp-Source: AGHT+IEZYHFDBfjQ2Mpo1j8jub8qHKOf7SS/Py5kpo1OJCfr/R12HQiYj4JCG2BghUcb+eX27JpSOQ==
X-Received: by 2002:a05:6a20:958f:b0:233:7c59:5bdd with SMTP id adf61e73a8af0-23dc0d3e334mr7233518637.13.1753898188184;
        Wed, 30 Jul 2025 10:56:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6af886sm9570176a12.52.2025.07.30.10.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 10:56:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 30 Jul 2025 10:56:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Srecko Prokic <prokicsrecko6@gmail.com>
Cc: linux-watchdog@vger.kernel.org
Subject: Re: NETDEV WATCHDOG + transmit queue timed out
Message-ID: <5fbde9b3-008e-4ecb-b615-543562c6c932@roeck-us.net>
References: <CACiZu+C2AysG9GrT_nvm9Gm2diqvoCmRxh1cD9OsgeVMpTnmUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACiZu+C2AysG9GrT_nvm9Gm2diqvoCmRxh1cD9OsgeVMpTnmUg@mail.gmail.com>

On Wed, Jul 30, 2025 at 01:31:24PM +0200, Srecko Prokic wrote:
> Hello all,
> 
> This is the issue I am experiencing,
> When I try to use network interface end0 on kernel version 6.14 for
> Rockchip RK3588 SoC, I get this in dmesg:
> 
> "rk_gmac-dwmac fe1c0000.ethernet end0: NETDEV WATCHDOG: CPU: 1: transmit
> queue 1 timed out 5408 ms"
> 

Wrong mailing list. This is not a watchdog problem, it is a networking
problem.

> dmesg:
> rk_gmac-dwmac fe1c0000.ethernet end0: Link is Up - 10Mbps/Half - flow
> control off
> rk_gmac-dwmac fe1c0000.ethernet end0: NETDEV WATCHDOG: CPU: 2: transmit
> queue 1 timed out 5388 ms
> rk_gmac-dwmac fe1c0000.ethernet end0: Reset adapter.
> rk_gmac-dwmac fe1c0000.ethernet end0: Timeout accessing MAC_VLAN_Tag_Filter
> rk_gmac-dwmac fe1c0000.ethernet end0: failed to kill vid 0081/0
> rk_gmac-dwmac fe1c0000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> rk_gmac-dwmac fe1c0000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-1
> rk_gmac-dwmac fe1c0000.ethernet end0: PHY [stmmac-0:01] driver [RTL8211F
> Gigabit Ethernet] (irq=POLL)
> dwmac4: Master AXI performs any burst length
> rk_gmac-dwmac fe1c0000.ethernet end0: No Safety Features support found
> rk_gmac-dwmac fe1c0000.ethernet end0: IEEE 1588-2008 Advanced Timestamp
> supported
> rk_gmac-dwmac fe1c0000.ethernet end0: registered PTP clock
> rk_gmac-dwmac fe1c0000.ethernet end0: configuring for phy/rgmii link mode
> 8021q: adding VLAN 0 to HW filter on device end0
> rk_gmac-dwmac fe1c0000.ethernet end0: Link is Up - 10Mbps/Half - flow
> control off
> 
> phy controller: realtek rtl8211f
> soc: RK3588
> 
> I tried to disable the TSO feature, but that did not work-same result.
> Also, I am pretty sure that the Device Tree config is okay, I tried
> the same DT config on the 5.10 kernel version and the network
> interface worked without issue.
> 
> Did anyone have this kind of issue? Some hints how to fix it or some
> reference patch?
> 
I'd suggest to bisect.

Guenter

