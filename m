Return-Path: <linux-watchdog+bounces-3543-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8804ABD25D
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 10:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D969D7AEF09
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 08:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B937026561A;
	Tue, 20 May 2025 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xYlOKwHu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B21DA61B;
	Tue, 20 May 2025 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731163; cv=none; b=oYz7nOrbyDiFVcmIn7g3zCp0fIh+tKVZMuMmWbBCCc9egrVbFbJfyjiIyaBO6PNwp+CPeBlEdoD4EBHItJKuaq3X6tr2GtJGhpJ/1D8uTDLBshH1qbSxC/4ncKXCRxTzQuZ3H4c2cNrq9MznXuCHdWiMLOWNrWTK9bHYKxac0OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731163; c=relaxed/simple;
	bh=qXEo/UrIkGCwUrlFozHzuYP47TLSy+9BFxO8UXHRiS0=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MvrAnd8TCkQWmV0vNMgpwV++36Dzd5QWomPeFIH+oQR3c10QqjPexCr/FrjJSNewv7k3wrEKhxkYKJXiFuJnLpGbUiTynFZG7g4X9VKpfARCrrHYCuppARwu3PEmQpGjgDXbLUCXe9HnY31fneyp6DJjfU9FsfzdWXc4CRwUrxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=xYlOKwHu; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K5nKFo003415;
	Tue, 20 May 2025 10:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	qXEo/UrIkGCwUrlFozHzuYP47TLSy+9BFxO8UXHRiS0=; b=xYlOKwHuL1ZgDVwh
	FNEeusm/eqTYERP2Y/YJk6M5jl38EMeKOQ0Nafgl68Ni7O650FDcSk2+YiizrXY/
	FMOCEipNGP847LM5w0Aroy4tAHdSECl5HFt7duJovBokGi2fCj4psE6Ucs1uNA22
	vHrdF66I/TiZUvTQk23RHJzYXp1Hw3FCOVw+ErtS1DimCaB39Ab/Y/IGcE5J44Ot
	5cm6KTadkByETx7wsGFfptpOnb1l5NJJao/IYIbZZjEBhU4bqTjwd6dWz3ZHJrKc
	zXCgK2aa1ejWu4o/NfT3p7cdRRc8BY3eCkMJY/7M/o5Di3/UaEr0ZCX1rGp9GOpX
	8Q/IxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfvkchka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:52:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 58CAC40082;
	Tue, 20 May 2025 10:51:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A27B1B373DB;
	Tue, 20 May 2025 10:49:48 +0200 (CEST)
Received: from [192.168.8.15] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 10:49:48 +0200
Message-ID: <cf096db75e9a321ee86eeb1685f4f1f5cb140e4b.camel@foss.st.com>
Subject: Re: [PATCH] watchdog: arm_smc_wdt: get wdt status through
 SMCWD_GET_TIMELEFT
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Guenter Roeck <linux@roeck-us.net>, Julius Werner <jwerner@chromium.org>
CC: Evan Benn <evanbenn@chromium.org>,
        Wim Van Sebroeck
	<wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Date: Tue, 20 May 2025 10:49:46 +0200
In-Reply-To: <2bb28691-def0-4365-98e0-7f53d4d19966@roeck-us.net>
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
	 <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
	 <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
	 <2bb28691-def0-4365-98e0-7f53d4d19966@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01

On Mon, 2025-05-19 at 18:13 -0700, Guenter Roeck wrote:
> On 5/19/25 17:12, Julius Werner wrote:
> > I don't really know about the issue Guenter mentioned, but otherwise,
> > from the driver's side this looks good to me.
> >=20
>=20
> It should just be
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set_bit(WDOG_HW_RUNNING, =
&wdd->status);
>=20
> There should be no dependency on CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
>=20
> Guenter
>=20

Thanks for the review!
I agree on Guenter's comment and I will send a V2 shortly.

Regards
Antonio

