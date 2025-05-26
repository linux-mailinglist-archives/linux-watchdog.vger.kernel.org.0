Return-Path: <linux-watchdog+bounces-3585-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6D3AC39AF
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 May 2025 08:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44FC61719F8
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 May 2025 06:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F46E1D54FE;
	Mon, 26 May 2025 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="KuLWbEVX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197E13B58C;
	Mon, 26 May 2025 06:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748239866; cv=none; b=qnJi/9IN7LU3zUaL8jwnN22kArSH6KtOCl3zjM8RtvuCzmNdlkcPl9M54rbZ0OaaXilzR5yaeMVy9pGvx6E9IjKrEik8dm4NV65Q6Nk9gf0URnYRIO9q0v8YeuILlqkQ0f0vFEjQUXMtUBur3wesyMsDM9tJ2eywajfkmdfA8ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748239866; c=relaxed/simple;
	bh=Pazv5lyvfwqwyv5xWPWxjJULX54oulkdPWiXGZyctXI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctbjJXDAQtQZlGLDC9anRN80ny7hKkyc5RtUFIeZXHuQQ8z9R+0WfAvHvfrOwwdRfEfIuUshsnXa0sDd727Uy6478Ju9ixL/hBvdG3dDdQ/VFvmHN+c7GGQjWbpU8JF5II8t8DBjgKW8io0ve7PitaiOoHd+MdqqnpdmctnQJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=KuLWbEVX; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q3L4xu005878;
	Sun, 25 May 2025 22:50:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=qjvzo2hjKfphfIXdWMv5N4pqu
	wjVMx5xP/vrtg8daeA=; b=KuLWbEVXVgxesZPkLnR+QX08M7UNHTl8T1hvD9AUS
	CXkCOWgCNIuBQERp0Y56BKnhn71lm8BUWhI/1Vknawuys2+x/Stnz+WBKVtqXZK1
	BX9VHW6cl8bESKJnkodT7mD/rEcLcGCCrYZzpPggEO6f+iVPaT9YPTzl7FomXFW2
	K3ygD81UaemcJwk4eM7FAlHby1d+D4UfO28G6GPkEfW5ZOFSdsnyn8eu2An02jY0
	25fT2pzI944v0l52pyv7W2TAuHMv8lqpytkb7sn30Kv1m+Ljb33mpI49l13m3yIh
	6a+4uu7AsJPndS0HeibrpTUQxkkgeumkwraSJjKqevxMQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46vgaer73t-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 May 2025 22:50:13 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 25 May 2025 22:50:12 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 25 May 2025 22:50:12 -0700
Received: from IPBU-BLR-SERVER1.marvell.com (IPBU-BLR-SERVER1.marvell.com [10.28.8.41])
	by maili.marvell.com (Postfix) with SMTP id D32323F7067;
	Sun, 25 May 2025 22:50:09 -0700 (PDT)
Date: Mon, 26 May 2025 11:20:08 +0530
From: George Cherian <george.cherian@marvell.com>
To: Guixiong Wei <weiguixiong@bytedance.com>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] watchdog: Introduce panic notifier for watchdog device on
 kdump
Message-ID: <20250526055008.GA619414@IPBU-BLR-SERVER1.marvell.com>
References: <20250525121939.43112-1-weiguixiong@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250525121939.43112-1-weiguixiong@bytedance.com>
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68340115 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=968KyxNXAAAA:8 a=jqcE-uVS5SI5BUF4LMUA:9
 a=CjuIK1q_8ugA:10 a=OBjm3rFKGHvpk9ecZwUJ:22 a=Vk6PiTWjA8A1ScrSUzLl:22
X-Proofpoint-GUID: a_7Fdf7p7dtavhyY2ls51PQczRexYwLU
X-Proofpoint-ORIG-GUID: a_7Fdf7p7dtavhyY2ls51PQczRexYwLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0NyBTYWx0ZWRfX511O3P7g7WFq 7m28RMUF4FWEhIvubWN2zUXVo2nSch6/Pr0yld0GYDMHU01pThYNeaPThUe+pLkUrtuosaHN0hD KGUF0yNhpJ5owh3E7jra4ARwXRa655bljf5brm35UiCXMTQ7MB6WHnyJ4BDd2vRBi4u3NwnTfsg
 iZqB+h+L204/D1rQZfaVsBFAQRpgvvKV+078zlMzBCMNJbAIaY9zjKEM5OBZQ0hbSwu6lt3sjrO GnKTYaeZF004xBO8rAG3zwmG7522g/tUbXA/nb8cVSvXvc2nN8rXZdSItM6Fmh4JXadVHSFK90Q JgSwFZzNlVUy/UrwcJTi2OeaHICmljNzsg24ftEmX8tAB6w78uB98XHbZ4UA4YLET3irqYAnQIT
 YC4XVI3X3XwsuaZ2qfJWZ2zWbl28bo1tUTs4TNKy9QJkoozDG53ZUHL43nbuiPK/O54rx63x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01

Hi Guixiong,

On 2025-05-25 at 17:49:39, Guixiong Wei (weiguixiong@bytedance.com) wrote:
> The watchdog device is not stop after kenrel crash. But the kexec
> kernel may not enable watchdog device. This will interrupt the
> long-time kdump process(e.g., TDX VMs with large-memory).
> 
> So introduce panic notifer for watchdog device. When kernel crashes,
> the handler invokes the watchdog stop callback, then the kdump
> process will not be interrupted by the watchdog device.
> 
> Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
A similar attempt is made in the following series here
Patch 1: https://patchwork.kernel.org/project/linux-watchdog/patch/20250522055715.3533356-2-george.cherian@marvell.com/
Patch 2: https://patchwork.kernel.org/project/linux-watchdog/patch/20250522055715.3533356-3-george.cherian@marvell.com/ 

For your particular use-case you need to set reset_on_panic to zero via
sysfs. This would disable the watchdog in panic notifier.
It would be helpful if you could test the series above and give your
comments/Tested-by.

Regards,
-George

