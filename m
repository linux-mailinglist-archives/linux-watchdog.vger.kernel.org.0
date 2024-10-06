Return-Path: <linux-watchdog+bounces-2097-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A00991F8F
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Oct 2024 18:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79CF41F2178B
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Oct 2024 16:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD2C189510;
	Sun,  6 Oct 2024 16:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="foqTwVDq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6F2AE6A;
	Sun,  6 Oct 2024 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728231061; cv=none; b=ryFUTp7FF3oBudND421565g2Tf4dFXGDETl3ioIWBsC6xuneQ6/bBZLN0dGyZeLMt6BlgdavLY+hEmTFdq5Il1kq2rLtq24+d0q+OzGxmVf/Yjt4muB/mUv/CP4dFxgaNGjdo8IUuK177QVa33JUZSRv3/COWV9bIpZXQBR7xK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728231061; c=relaxed/simple;
	bh=lS4hS9Lxo/EZBYEoIcBXy5P3XLmzfIRiV9kgabYPYOY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uevFS7dHbxS+q5YkRV17wF562UBRr095d0b/DWSAjsYjRkYoz1WHuFzI1Sc4smdqyZ74aoCl1hkA53/hZSDrZbZs6NQPWprfBiJTDPkoCrzhEQthAb8KNZbLbLnh6weW6fbaCB6aTRMMMc5/2XK+SoN+J8nbfidQ1UBeUdM7Nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=foqTwVDq; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49652P22010821;
	Sun, 6 Oct 2024 16:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pps0720; bh=+EGG7YeHCw7UnDmHb
	ZJl0ONFq1STmw1DKfwJZvZMc8Q=; b=foqTwVDqNHLMhbXOOqLQy/GQl5ryKO0z0
	zForU5kj7Xe9ufHT1U23a0/OPwvXrlCcSVjkHaXb8ooHnC/G7RrevX2y4lfvYf/U
	R/i5ezWtQtDqv0O1ZR+6AvK90jgoWgJb+wK0wM69r51YqjGnxNNVS5Ke1L6n/rO8
	Wai/y4qQqE8AFRQUC/ceY4pTBjOK84Mt1z+IwAWEVbru8OdT6kBoauuNaDxJGDat
	DaDg980cOk2ASMU6x8S+EsYQnrrWS0LWnM73CeK5LV8Hn1zzuczzw1lvH3a+YZiC
	ag/aN9WzNLMAMYqA8e+26rqhdfUulDrhrCvI/ElVw8mcYoZlab2Jw==
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 422ywhe7n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Oct 2024 16:10:31 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id B91F2806B2F;
	Sun,  6 Oct 2024 16:10:30 +0000 (UTC)
Received: from anatevka.ftc.rdlabs.hpecorp.net (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 3C42980977B;
	Sun,  6 Oct 2024 16:10:28 +0000 (UTC)
Date: Sun, 6 Oct 2024 10:10:27 -0600
From: Jerry Hoemann <jerry.hoemann@hpe.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 3/9] watchdog: hpe-wdt: don't print out if
 registering watchdog fails
Message-ID: <ZwK2c9Bx7P3OyVYc@anatevka.ftc.rdlabs.hpecorp.net>
Reply-To: Jerry.Hoemann@hpe.com
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-4-wsa+renesas@sang-engineering.com>
 <ZwBeJUXqm3Tf0th_@anatevka.ftc.rdlabs.hpecorp.net>
 <ZwDNR29rqWcLYlRZ@shikoro>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwDNR29rqWcLYlRZ@shikoro>
X-Proofpoint-ORIG-GUID: LF_wrfm_cvMR5LCSisR7l2RkT_Jlue8A
X-Proofpoint-GUID: LF_wrfm_cvMR5LCSisR7l2RkT_Jlue8A
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=845
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410060117

On Sat, Oct 05, 2024 at 07:23:19AM +0200, Wolfram Sang wrote:
> On Fri, Oct 04, 2024 at 03:29:09PM -0600, Jerry Hoemann wrote:
> > On Fri, Oct 04, 2024 at 10:03:06PM +0200, Wolfram Sang wrote:
> > > The core will do this already.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  drivers/watchdog/gxp-wdt.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > Question:  should email have been titled
> > 	"watchdog: gxp-wdt: ..."
> > instead of
> > 	"watchdog: hpe-wdt: ..."
> > 
> > to match the module name as the email title gets put into
> > the git log for the file?
> 
> No objection, we can do that. I check git-log for the prefixes and found
> there the following:
> 
> 6b47441bed49 ("watchdog: hpe-wdt: Introduce HPE GXP Watchdog")

That is somewhat unfortunate as it will can lead to confusion with
the long standing hpwdt.  These are different watchdogs.

Jerry
> 
> I am fine with both.
> 



-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------

