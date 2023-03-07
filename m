Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC196ADE3F
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Mar 2023 13:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjCGMBl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Mar 2023 07:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjCGMBi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Mar 2023 07:01:38 -0500
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9843E630
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Mar 2023 04:01:34 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 327505E3006830;
        Tue, 7 Mar 2023 05:32:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=jJeUdmNUyDsgd83OAuX65WN0GlkAU0ryfn1ijMYdx64=;
 b=aDMRz0FIRHbStRzsLHEJAEDwajNGGVO3nethO1qRQGQPvTbrpugEmKH+FMQdbMBFgYdJ
 aJNkGvnLIHgMx+4zRWR26l5WbGnHr6lmjdMiVDwfeLgEnt3l+yQnY5Zi8WRiA2HAdfo2
 f/fnIkIt8fgmXlDm10/GziswM4IlMnEfM39V9lORQhEbouHEVxaUMqzIYjYO7iRbVI6w
 7OFTyVbKaVDul3M8DXnkhgHYx2H7CU74bwrTwPa3BYqpJWeYMRW8VaUERmjs/sZz4cU3
 N3FXAbuv9Vhp4eHcreuc8nrvFBXEZDnmLFkAJ7o1gdD1Q6WMEtYMGWxVqLL1bGXmd4hS Pw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3p439tc38f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Mar 2023 05:32:11 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 7 Mar
 2023 05:32:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Tue, 7 Mar 2023 05:32:10 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 461B1458;
        Tue,  7 Mar 2023 11:32:10 +0000 (UTC)
Date:   Tue, 7 Mar 2023 11:32:10 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        <patches@opensource.cirrus.com>, <linux-watchdog@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] watchdog: wm8350: Simplify using
 devm_watchdog_register_device()
Message-ID: <20230307113210.GT68926@ediswmail.ad.cirrus.com>
References: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
 <20230307070404.2256308-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307070404.2256308-4-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Zu_m6QNQm8CD0-eP-bALIC49vvAfsbfW
X-Proofpoint-ORIG-GUID: Zu_m6QNQm8CD0-eP-bALIC49vvAfsbfW
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 07, 2023 at 08:04:04AM +0100, Uwe Kleine-König wrote:
> This allows to drop the .remove() function as it only exists to
> unregister the watchdog device which is now done in a callback
> registered by devm_watchdog_register_device().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
