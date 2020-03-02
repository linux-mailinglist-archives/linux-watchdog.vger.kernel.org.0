Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A061756B1
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2020 10:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCBJPx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 04:15:53 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:50278 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726654AbgCBJPx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 04:15:53 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0229EGWC010138;
        Mon, 2 Mar 2020 03:15:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=y8QM+XoK9yFgrjrmzHNSkNBsrFZrqnpOHADaZte4ZwY=;
 b=R3ZwVCKWZTRyNrTTlbQpU2ry48a88hA6e1hXOh6b9QVMsPPgvy54ivnSWDJT+tQLYLg3
 xxESedr9+NdRvnAiGh1H3vVVbnBQG9A3XMWplTtkE2PfKhpMukRYrQL4tTUMi3cPOzvh
 f9yi22NfApq1Pmql/RIaPmGHu6k9u3jfGzRQf+MDEcsa0VxfN/saZdi7JcZbO7b8PUqU
 0VlBmsvyvB4xF5fpb5yfiZDeikVlHVJnZq6Q3RTKjRVQm1dGtp5qq5MoNrFA/uk3JPsk
 5G4E6ypgl0KDSr/ALHHyiDWmK5cEEsCWblR2Ww9uTpGI3hhfU2JEEA3bv2pA4SYjx+uS AA== 
Authentication-Results: ppops.net;
        spf=pass smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
        by mx0a-001ae601.pphosted.com with ESMTP id 2yfp89txqv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 02 Mar 2020 03:15:31 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 2 Mar
 2020 09:15:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 2 Mar 2020 09:15:29 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CCF642AB;
        Mon,  2 Mar 2020 09:15:29 +0000 (UTC)
Date:   Mon, 2 Mar 2020 09:15:29 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] watchdog: wm831x_wdt: Remove GPIO handling
Message-ID: <20200302091529.GK108283@ediswmail.ad.cirrus.com>
References: <20200229115046.57781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200229115046.57781-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003020072
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Feb 29, 2020 at 12:50:46PM +0100, Linus Walleij wrote:
> An attempt to convert the driver to using GPIO descriptors
> (see Link tag) was discouraged in favor of deleting the
> handling of the update GPIO altogehter since there are
> no in-tree users.
> 
> This patch deletes the GPIO handling instead.
> 
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/linux-watchdog/20200210102209.289379-1-linus.walleij@linaro.org/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
