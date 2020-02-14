Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05BA015D964
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2020 15:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgBNO0e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Feb 2020 09:26:34 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:27310 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728123AbgBNO0e (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Feb 2020 09:26:34 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01EEP3Pf024353;
        Fri, 14 Feb 2020 08:26:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=U6qKy7cs9oRNnaRfqOZ/roMszJAm4Xv4q8p55wB5rDs=;
 b=fLAoZMoJ2LbCsI8k+53LARmUcgyd2yxndK7sujdBytYPcWzCfskTG3h32t/c1aoaqrmb
 cy6RfNZZ/oXtXd2QC+AXGMlmCTCbg8Jgdv0NPLJSStdIVcZAC1nt9/RpeM2t/6BQtGkk
 fWAXp7Atf5cZwUa3MXYoNX4FrvS4087Mx19XSKTD25lMPgVtNbxO86I85jWZgP1hRwue
 WQZLMxndwdhccluuAzobn7l6lQg02OsIxDHtw7Y+8R6N8kuKK7/QpfX9zRf3voKdQqoM
 lLOLc4ZhYoPPRM0fQnrOqfE7+/WYCQ1lfe2Mtnx0in1IyLxJDpN6Cq5Er2UiwG9lFj0Z IQ== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
        by mx0a-001ae601.pphosted.com with ESMTP id 2y1u9a2fk2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 14 Feb 2020 08:26:12 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 14 Feb
 2020 14:26:10 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 14 Feb 2020 14:26:10 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7C6442AB;
        Fri, 14 Feb 2020 14:26:09 +0000 (UTC)
Date:   Fri, 14 Feb 2020 14:26:09 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND] watchdog: wm831x: Use GPIO descriptor
Message-ID: <20200214142609.GF4098@ediswmail.ad.cirrus.com>
References: <20200210102209.289379-1-linus.walleij@linaro.org>
 <26fc06fb-fd1d-064b-4015-d68a98369ecb@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <26fc06fb-fd1d-064b-4015-d68a98369ecb@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=926 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140115
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Feb 10, 2020 at 06:25:35AM -0800, Guenter Roeck wrote:
> On 2/10/20 2:22 AM, Linus Walleij wrote:
> >The WM831x watchdog driver passes a global GPIO number from
> >platform data into this driver, this is discouraged so pass
> >a GPIO descriptor instead.
> >
> >More thorough approaches are possible passing descriptors
> >associated with the device through machine descriptor tables,
> >but no boardfiles in the kernel currently use this driver
> >so it is hard to test.
> >
> >Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> >Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> >Cc: Mark Brown <broonie@kernel.org>
> >Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Interesting, I don't see evidence of the original patch in
> watchdog patchwork.
> 
> Anyway, it seems to me it would be better to remove the gpio code
> entirely from this driver. It is instantiated from an mfd driver
> which doesn't set the gpio pin. It is quite unlikely that it is
> ever going to be used, so we might as well remove it (instead of
> modifying it without ability to test it).
> 

We don't have any internal users for the WDT GPIOs here, given
the age of the part perhaps removing the GPIO is the simplest
solution.

Thanks,
Charles
