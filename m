Return-Path: <linux-watchdog+bounces-3311-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36567A8B1ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 09:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B65AC3AEC39
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 07:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949F122D4E0;
	Wed, 16 Apr 2025 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="D/ByJwt7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4922C336;
	Wed, 16 Apr 2025 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788139; cv=none; b=tCz4XCTYu2tt7HN+41/ns90oCjymgVDYJtaxkFZZ2Ki+7S1RW391tq7FQtnZ+SlE3aXU4q/UFPDQ4oLuDw82kNMeSB09xzAXscwtacQr13ZSTcVFJD1aWD8j6pEv9I7ODDEiTi7wGLvJ5WaR770HPV4un6yab+K/tYYyg2f6ALc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788139; c=relaxed/simple;
	bh=pq9E7g2iPBPNHP3j9zLHxqTxjogm10Qq37msVgpxYTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2Udq8lxJkARrrK5U6fuJ9fbLWpv3/LuPRK6hpwz7LqDUPLUvV+w1xYxZTowCq2tAYZxTNrxbVkR9m09pNqSA6C9YDUeJGczzCB2obU7nyRFfkGdUGFGBbSuBfutg1luh07FCwRV0fRjnpQlG6Hw0gP9t4wbRZ0SaQEGUmNWHHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=D/ByJwt7; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJbme3021767;
	Wed, 16 Apr 2025 07:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=BMzl79yb8d1fDamDeMLAWNQP69WWyr
	XmT0w7knPA3X8=; b=D/ByJwt7LsJ5/vmf1pFn6/pl/Oa9EOUpqvXDRtDy5E4T24
	JmD7LqNGIRXhxGsQTB1LmgZWvT9RIRwCeqPEbswBYa2GjDviaZUryAdoVsibo9zN
	2r0hwkqXt3GLn17eQWFSRqXznMXvJl58DpiD/WGQV6i0tpKzuc+xiaLTddmp79ol
	pmq2hpguR4lwHH8KcJ8u6N3Ff5O2INT38CfnX89TRxl2aq1ouKeGkmzWSnJiZley
	ILzUdtXX1VULU7JEo9zP6bXP0/7wUy1yvTPaARo8NGqQF7J/ADkewcSGRXQxm3VM
	zurFEjRNOcK58fd7tJf7MPJ16ERLOt+Hhp1ykbmg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461nwq5054-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:22:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53G3Fr4t010467;
	Wed, 16 Apr 2025 07:22:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4604qk6ted-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:22:01 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53G7LvQo33096442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:21:58 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D01792004B;
	Wed, 16 Apr 2025 07:21:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85B1A20043;
	Wed, 16 Apr 2025 07:21:57 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Apr 2025 07:21:57 +0000 (GMT)
Date: Wed, 16 Apr 2025 09:21:55 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] watchdog: diag288_wdt: Implement module autoload
Message-ID: <20250416072155.7284A2f-hca@linux.ibm.com>
References: <20250410095036.1525057-1-hca@linux.ibm.com>
 <abe3b3f3-0c9d-4ac2-af1f-59aa186c723c@roeck-us.net>
 <20250415162440.7369A19-hca@linux.ibm.com>
 <bd9de770-7e51-4ed9-bbef-2a11ad7eb1b3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd9de770-7e51-4ed9-bbef-2a11ad7eb1b3@roeck-us.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QRDgFfAulZlAFvGHKdAoIObescVAngzu
X-Proofpoint-GUID: QRDgFfAulZlAFvGHKdAoIObescVAngzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=559 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160056

On Tue, Apr 15, 2025 at 09:51:35AM -0700, Guenter Roeck wrote:
> On 4/15/25 09:24, Heiko Carstens wrote:
> > On Thu, Apr 10, 2025 at 05:10:50AM -0700, Guenter Roeck wrote:
> > > On 4/10/25 02:50, Heiko Carstens wrote:
> > > > The s390 specific diag288_wdt watchdog driver makes use of the virtual
> > > > watchdog timer, which is available in most machine configurations.
> > > > If executing the diagnose instruction with subcode 0x288 results in an
> > > > exception the watchdog timer is not available, otherwise it is available.
> > > > ---
> > > >    arch/s390/boot/startup.c           | 17 ++++++++++
> > > >    arch/s390/include/asm/cpufeature.h |  1 +
> > > >    arch/s390/include/asm/diag288.h    | 41 +++++++++++++++++++++++
> > > >    arch/s390/include/asm/machine.h    |  1 +
> > > >    arch/s390/kernel/cpufeature.c      |  5 +++
> > > >    drivers/watchdog/diag288_wdt.c     | 53 ++----------------------------
> > > >    6 files changed, 68 insertions(+), 50 deletions(-)
> > > >    create mode 100644 arch/s390/include/asm/diag288.h
> > 
> > Guenter, Wim, I assume this can/should go upstream via the s390 tree?
> 
> It touches s390 core code, and you did not suggest otherwise when submitting
> the patch, so that was my assumption.

Sure, just wanted to check that everybody is fine with this.
Will apply this later to the s390 tree.

Thanks!

