Return-Path: <linux-watchdog+bounces-2156-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC02997C19
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 07:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3AB283E37
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 05:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2E94A15;
	Thu, 10 Oct 2024 05:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="V4I2w9U4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F502F50
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 05:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728536548; cv=none; b=hCh26hDqWkehp+fpd9TniEs21e/W8TvVplbRbkecZ0SQdfnsp8QLVrrgSFNqc8eqBzGuplH+yxHUTdwQxjDppkiXhH6Ov5URYfmsMH1ydOArW8eVhc58+lewDO8cpVP6JcbxA6s+PF2+fxvdVaXK0op65LxymR1hZMbdlqBOLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728536548; c=relaxed/simple;
	bh=n6zpKRfG/ZrKFiysS/9JxR4hhuXtvqxtIqZSskWDQ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUomLFrSg6CaEb/eF0ZB3KmMLaE15sswtCRCQNswmvRHZ8iKvIu+cjlry6FwjgUMDOcm7feWZm8agzRLu0pNhBKxrDrveB8UDh1gdjUc+gp6sUXjhaksxlxhsUdryncEK6j+ql9TcUFe5Uj9M/lfD7QwXftTR3owkjGo45vJuKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=V4I2w9U4; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A22kZN003815;
	Thu, 10 Oct 2024 04:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pps0720; bh=CAVMmXlxQgsXomHLX
	wjyi3K/Cn9rOFJFKi/nT3zH/ys=; b=V4I2w9U4qYYe3c1bgqxtGmMT55GQrpPaq
	PdvD6Gy4sSgdSclkdRfzf3CihMmYpbVcK9PcTSiI3qIa0CejVDT6LspDtN5358m/
	fUigw5n/5lu4lCsm8+WxrZ9kN3U6TSbYn/MGVFL/Ysxc7PdXejXrSCcdkPI+r5Xc
	ttUVnXXS+9Seph8JRFyt/akIrJoB6DzDOAYxQgHwndz4SxqEFDTYuM1fppIvDqhx
	UzvwtXV5ffwoVQxtiET+lpc7+gJLpaOcLgaMP6lunru4wG/C2yoZszM4Awf8jwL2
	+c5QqW8rk9mLT2OviBl3rDTkGWthRiyDPvcrGMQTUEzeosjWpSsAg==
Received: from p1lg14880.it.hpe.com ([16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4255vdrc43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 04:44:06 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 767248001A1;
	Thu, 10 Oct 2024 04:44:05 +0000 (UTC)
Received: from anatevka.ftc.rdlabs.hpecorp.net (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 0D5A1801717;
	Thu, 10 Oct 2024 04:44:04 +0000 (UTC)
Date: Wed, 9 Oct 2024 22:44:03 -0600
From: Jerry Hoemann <jerry.hoemann@hpe.com>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-watchdog@vger.kernel.org, 898336@bugs.debian.org,
        Marcos =?iso-8859-1?Q?Ra=FAl?= Carot <marcos.carot@gmail.com>
Subject: Re: DL380 instability with hpwdt
Message-ID: <Zwdbk_P1CRhXfx7Y@anatevka.ftc.rdlabs.hpecorp.net>
Reply-To: Jerry.Hoemann@hpe.com
References: <0db492a0e8e5474f67bafdab7ae0a50b69cbc717.camel@decadent.org.uk>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db492a0e8e5474f67bafdab7ae0a50b69cbc717.camel@decadent.org.uk>
X-Proofpoint-ORIG-GUID: CYPiSNC5yGHn4cGyzqbmiz98Xz0gweeN
X-Proofpoint-GUID: CYPiSNC5yGHn4cGyzqbmiz98Xz0gweeN
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100029

On Wed, Oct 09, 2024 at 09:00:00PM +0200, Ben Hutchings wrote:
> Hi Jerry,
> 
> The Debian kernel team received a number of reports over the past few
> years of instability of the Proliant DL380 G7 and DL380p G8, seemingly
> related to the hpwdt driver (in that this goes away if it is not
> loaded).  These reports can be seen at
> <https://bugs.debian.org/898336>.
> 
> The instability has been seen with kernel versions ranging from 4.16 to
> 6.1.y, including after the backport of commit dced0b3e51dd
> "watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO").
> 
> I can see that hpwdt seems to be used for error reporting so it's not
> clear to me whether these are problems caused by the driver, or the
> driver is only reporting that something bad happened.
> 
> Do you have any ideas about what's going wrong here?  Is there
> something odd about these models that needs to be handled in hpwdt, or
> are they just popular models?

Hi Ben,

There are a couple things that come to mind.

As you mentioned,  hpwdt is used for error containment on ProLiants.
(Especially on the older generations) Errors would be raised as
NMI and the expectation was that hpwdt would handle the NMI and
initiate a kdump.  I have seen cases where shutting down file
systems can raise PCIe errors which would be transmitted to the
SUT as NMI and handled by hpwdt.

The second issue is that systemd enables WDT (not just hpwdt) during 
shutdown.  This is to handle the case where shutdown hangs.  The WDT
is supposed to break the system out of such situations.  The default
timeout is 10 minutes:
	/etc/systemd/system.conf:
	#RebootWatchdogSec=10min
(note, I'm not a Debian user, but i believe the systemd behavior is the
same on Debian as it is on rhel/sles.)

While a ten minute delay to shutdown would be fairly obvious if you're
doing interactive testing, it might not be noticed if the testing is
automated.

To determine if either of the above is happening, you can:

o) do the testing interactively and time the test.  Does the NMI come in
roughly 10 minutes after the shutdown?

o) Check the IEL and IML on the iLO web interface.  Do you see any
errors reported during the shutdown?


Questions:
1) The Debian bug above mentions only Gen 7 and 8 systems.
   Are you seeing this issue on other ProLiant systems?

2) You mentioned back-porting commit dced0b3e51dd.  Does your
   drivers/watchdog/hpwdt.c source match upstream Linux? Or
   do you cherry pick patches?  (sorry, not knowing Debian,
   I don't know how find/navigate your kernel source.)

Please let me know what you find.


Jerry


-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------

