Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1055D56A746
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Jul 2022 17:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiGGPyA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Jul 2022 11:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiGGPx7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Jul 2022 11:53:59 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD18F1DA4A
        for <linux-watchdog@vger.kernel.org>; Thu,  7 Jul 2022 08:53:58 -0700 (PDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267FhjBg005846;
        Thu, 7 Jul 2022 15:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=L5jTqjAbHF8ucgKk4OVIec+FMNlVttQgV25t7UPR7Io=;
 b=PQ4uAarUHEY4Wfzbid+GIABxIEXSLl9iK55NLXSLK0XvaPtfNulAY6hPWwK0jbBUPx3O
 o2BodAa1LcuIGg70FiyB+vOp1nC6WKL/hYPjuDIccLowvM0VUSscL+/6tcMOHqjTN6LY
 lE57VdU9AnZ7lWbhsoWuA5dk2BsLAO1KQjo1vnUXYHPf2E11gZgD3K36CliUTqkZZaFm
 9QUaqF/0pDN79wb8NHuX85kzkarEiPE2ONoKUP/FN6tLXp7x5yUa3PrPk2ORS+MecH76
 X79mPKcd8uFn51UbwktJ08k8aUF+zqqjZ1CBdQdIMxvWSN41xe8IsYvdzs9LQyQSXAho 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62cmg915-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 15:53:35 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 267FkIIO019142;
        Thu, 7 Jul 2022 15:53:34 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62cmg90u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 15:53:34 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 267FpCj0006608;
        Thu, 7 Jul 2022 15:53:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma02wdc.us.ibm.com with ESMTP id 3h4ucxvc3a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 15:53:33 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 267FrW7B36897168
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 7 Jul 2022 15:53:32 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A724913605D;
        Thu,  7 Jul 2022 15:53:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8C5FF136059;
        Thu,  7 Jul 2022 15:53:32 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu,  7 Jul 2022 15:53:32 +0000 (GMT)
Date:   Thu, 7 Jul 2022 10:53:32 -0500
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linux-watchdog@vger.kernel.org, nathanl@linux.ibm.com,
        wvoigt@us.ibm.com, aik@ozlabs.ru, vaishnavi@linux.ibm.com,
        npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Subject: Re: [PATCH v2 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Message-ID: <YscBfCR2CROlpJtK@rascal-austin-ibm-com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-5-cheloha@linux.ibm.com>
 <87sfnu41bu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfnu41bu.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TUYuE9uaisiBcwzY7ySmwrQ8S6WNGqHS
X-Proofpoint-GUID: YutEdEhtIKO5ZdhTQ_7PRXwjtn-S2Tfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1011
 adultscore=0 mlxlogscore=941 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070061
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 24, 2022 at 11:51:01PM +1000, Michael Ellerman wrote:
> Scott Cheloha <cheloha@linux.ibm.com> writes:
> ...
> > +
> > +static struct platform_driver pseries_wdt_driver = {
> > +	.driver = {
> > +		.name = DRV_NAME,
> > +		.owner = THIS_MODULE,
> 
> That owner assignment is not required.
> 
> It's set for you by platform_driver_register() via
> module_platform_driver().

Great, removed.
