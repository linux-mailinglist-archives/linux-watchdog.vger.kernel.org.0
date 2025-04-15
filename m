Return-Path: <linux-watchdog+bounces-3304-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD8EA8A404
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 18:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E22F188D6F1
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 16:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98EC27A939;
	Tue, 15 Apr 2025 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qVOR87i4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7082DFA36;
	Tue, 15 Apr 2025 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734303; cv=none; b=THW0kXN+5Z1RUltUHXE+dUaiRVdH8hKT3GxnQ8fLmyT7ZGs/s96/7bPgo8oMhbhCjZGkmuMghLdZGYubPvvOyQ6ytm00RlQWdo5CHXC1VS/0uL2cEKh2Eg7wsPWbt+/Bc4XX3cDZ1aBqkWEp5m7f+wSnjVVec0vK/2+fn9at73U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734303; c=relaxed/simple;
	bh=0O78ak6MSuozBuhgdIN++Wl5N4PEUNU3iUWbreypelg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcnXLdExobj2n2h0Bf+WwOJJpGfu8f5taLLv/4jN48llZcGaBfSDeWPe//CD4zUx6mhXqcJ7H2X5NAMBa9lW3EgU6psEXOs94lkpV45zWYVHN9Ux35xOOGwKxctyvOTjis76OFHDl7PO2eo7xtTj2hW3aD+NWaI0ThWq0kab33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qVOR87i4; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FA43Mg021108;
	Tue, 15 Apr 2025 16:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=DRD9jvOWxfBc0cB36tPQCyGHPsis8k
	WeX3jpN01vByg=; b=qVOR87i4tJ7FdNol43cvmOjESonmBTNUqSxnJA4E6BP3MM
	/0z/77d9Y3QdYkL6NxjgGAqf70W+r/X0uTjUu7hrtc7yYO3dewJdg0DT4kRfEZUO
	TAxBZwvL1eNLUt64Wt3LxhQ3uNAPhq2cugHG+sFFgX5lhyeeVF5nyQv//giAMFJ2
	xHNfYZEJ86pz0FgLpV3gPV4Geke5E+rofkJGVma+JBoMvD2Os6jJauHeCZCa1iBX
	vUusDX3+3QApFtZmmpxtLU+gOKXGh6PvQW1ReLU8nIUGZS/XIYaC3q7SRKXLBvr9
	p35CiwKvXsbMOCx3aEo0ohcTBxu8VaulVebWDBOw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461ncfhxfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 16:24:47 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53FDhbcu030906;
	Tue, 15 Apr 2025 16:24:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4603gnm039-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 16:24:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53FGOg8B50266466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 16:24:42 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5052F20043;
	Tue, 15 Apr 2025 16:24:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C85812004B;
	Tue, 15 Apr 2025 16:24:41 +0000 (GMT)
Received: from osiris (unknown [9.179.18.84])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 15 Apr 2025 16:24:41 +0000 (GMT)
Date: Tue, 15 Apr 2025 18:24:40 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] watchdog: diag288_wdt: Implement module autoload
Message-ID: <20250415162440.7369A19-hca@linux.ibm.com>
References: <20250410095036.1525057-1-hca@linux.ibm.com>
 <abe3b3f3-0c9d-4ac2-af1f-59aa186c723c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abe3b3f3-0c9d-4ac2-af1f-59aa186c723c@roeck-us.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N2L8goNkmMmnHQ7v-VWfBXT4X3XdFyBc
X-Proofpoint-GUID: N2L8goNkmMmnHQ7v-VWfBXT4X3XdFyBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=496 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504150112

On Thu, Apr 10, 2025 at 05:10:50AM -0700, Guenter Roeck wrote:
> On 4/10/25 02:50, Heiko Carstens wrote:
> > The s390 specific diag288_wdt watchdog driver makes use of the virtual
> > watchdog timer, which is available in most machine configurations.
> > If executing the diagnose instruction with subcode 0x288 results in an
> > exception the watchdog timer is not available, otherwise it is available.
> > 
> > In order to allow module autoload of the diag288_wdt module, move the
> > detection of the virtual watchdog timer to early boot code, and provide
> > its availability as a cpu feature.
> > 
> > This allows to make use of module_cpu_feature_match() to automatically load
> > the module iff the virtual watchdog timer is available.
> > 
> > Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> > Tested-by: Mete Durlu <meted@linux.ibm.com>
> > Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> > ---
> >   arch/s390/boot/startup.c           | 17 ++++++++++
> >   arch/s390/include/asm/cpufeature.h |  1 +
> >   arch/s390/include/asm/diag288.h    | 41 +++++++++++++++++++++++
> >   arch/s390/include/asm/machine.h    |  1 +
> >   arch/s390/kernel/cpufeature.c      |  5 +++
> >   drivers/watchdog/diag288_wdt.c     | 53 ++----------------------------
> >   6 files changed, 68 insertions(+), 50 deletions(-)
> >   create mode 100644 arch/s390/include/asm/diag288.h

Guenter, Wim, I assume this can/should go upstream via the s390 tree?

