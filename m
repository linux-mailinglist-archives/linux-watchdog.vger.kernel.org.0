Return-Path: <linux-watchdog+bounces-3902-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1100B10051
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 07:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7907176DA0
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 05:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC3D207A2A;
	Thu, 24 Jul 2025 05:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mYsbzx7N"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7293A2040B6
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753336711; cv=none; b=DUOcymXf1ZdH1gGS4kRcGl3n9VcM0nSv/0MGc2AGTocxvum4dle9LgAuw+d9A1t0s1sQEfmx8Myvdd/Obms/+jCeO+l6LLEoqBvP/A6BJ1+yacCgEQxM6gHywGn+ovCQOSzsZJEcx8662oqYhgLbaGGbfOSlIL3GngyxNQ8NwSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753336711; c=relaxed/simple;
	bh=IkXG1pkjcUMXctT/z50vtS63B3KvuhHX5pdbbAWHIyQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=FYWxmwU4p7VMoQPOvdG6FzF27/G0borMEsRKmhbSL88if7JRPf/hz/uemA7H28lJ6xqp2kZ+W80TEhZvh4tzikDW+xSuzSaXRubIZ+NMnESc81KNqYuhkobkcIC4IgYJ01b2UkpGAimGXEiejIV7zp3MmhDNBZwv8+TQKPmTkEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mYsbzx7N; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250724055827epoutp03a552a92cb290984ad1eecf43af652931~VGnIuUmpS1840618406epoutp03V
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 05:58:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250724055827epoutp03a552a92cb290984ad1eecf43af652931~VGnIuUmpS1840618406epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336707;
	bh=PcqtFrXlhmcs0tO7hoxuK5bQDsVASZTvkmxva8sAz+A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mYsbzx7NewkaXVHZQGfW9TW0WA+ptzFmKbQ8dycQfbVrQs6FWG7WHUqo/gcxB/9A5
	 LkFMaaUpT8f227bCdpaUrSjoF7NCh1tlREo2Ktvcqfwv0ac4DD4RnEseV/55vY8Zmb
	 LJmganNukGgVm+kQQsrJW3g/AnuvQsnJqIkDnby8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250724055826epcas5p446cf77b5301b2e805b8b626dab172725~VGnH7j8ho2262122621epcas5p4q;
	Thu, 24 Jul 2025 05:58:26 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bngKY4JZLz2SSKj; Thu, 24 Jul
	2025 05:58:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250724055825epcas5p1b0b35277e5ded326d4377a3521f10179~VGnGbZnzb0629006290epcas5p1_;
	Thu, 24 Jul 2025 05:58:25 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055824epsmtip1ec26a66e718f21098113071d7d8beaea~VGnFYqVnU3176031760epsmtip12;
	Thu, 24 Jul 2025 05:58:23 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-6-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 5/5] watchdog: s3c2410_wdt: exynosautov9:
 Enable supported features
Date: Thu, 24 Jul 2025 11:28:22 +0530
Message-ID: <2b5f01dbfc5f$f7fb5d20$e7f21760$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgLwxs4UAgINVK+zyFf1UA==
X-CMS-MailID: 20250724055825epcas5p1b0b35277e5ded326d4377a3521f10179
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61@epcas2p1.samsung.com>
	<20250714055440.3138135-6-sw617.shin@samsung.com>



> -----Original Message-----
> From: Sangwook Shin <sw617.shin@samsung.com>
> Sent: Monday, July 14, 2025 11:25 AM
> To: krzk@kernel.org; alim.akhtar@samsung.com; wim@linux-watchdog.org;
> linux@roeck-us.net
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; Sangwook Shin <sw617.shin@samsung.com>
> Subject: [PATCH v3 RESEND 5/5] watchdog: s3c2410_wdt: exynosautov9:
> Enable supported features
> 
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_MAXCNT
> 
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



