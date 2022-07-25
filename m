Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E267580279
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Jul 2022 18:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiGYQML (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Jul 2022 12:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235742AbiGYQMK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jul 2022 12:12:10 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AF1DFB2
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 09:12:09 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PG9S8F028278;
        Mon, 25 Jul 2022 16:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=VEyXKsLKkNRouMWUVwi/lwM5zyAUu5jFyXE4yvmUVg4=;
 b=p4mC6ISK63UhtWOy328GRCW/XKXETz3gPP9OEPdqBfBvPiCuA1BrLbHgS7kXtten01cc
 JYjXpQQ+pPbUOslT5xBKeC6Goc1cp3311UR+fqXWoc0s7X8Jj9FE6apx8eXSFxSPnRzW
 ZcjUsPA4L1GTzAHamBkYrQ7NYbpyi3U/YdsUYgraPBGvM2RPtSuB8mE5v2fUNUcCd0nG
 9x0wPzSJJEFfg4eQX2/u/2IGjYDeYU5kXgTLJ6lKvxPzdv2on5hNbopCJhl8Ne+qosEG
 E/G2QQhwYb/XfOgv7ria72Ogt83ZSFW0l8XwkrEhY5PzfRj4SxzMcniHuUZhscbHBSPk hg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhx588ve5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Jul 2022 16:11:44 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26PG9TPx028476;
        Mon, 25 Jul 2022 16:11:43 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhx588vcx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Jul 2022 16:11:43 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PG54Qq007332;
        Mon, 25 Jul 2022 16:11:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma01dal.us.ibm.com with ESMTP id 3hg98rrrr7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Jul 2022 16:11:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26PGBfZF64094482
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jul 2022 16:11:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 966F5112063;
        Mon, 25 Jul 2022 16:11:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 713F3112061;
        Mon, 25 Jul 2022 16:11:41 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon, 25 Jul 2022 16:11:41 +0000 (GMT)
Date:   Mon, 25 Jul 2022 11:11:41 -0500
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        MichaelEllerman <mpe@ellerman.id.au>
Cc:     linux-watchdog@vger.kernel.org, tzungbi@kernel.org,
        brking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Message-ID: <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
 <20220713202335.1217647-5-cheloha@linux.ibm.com>
 <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: COQ3pD9I0UPFyKru2zaYuYKHtw1cCm--
X-Proofpoint-ORIG-GUID: lR_QCgAaIZoq2vdUyUj0xSFMOk4v0YKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_11,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250066
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 13, 2022 at 01:50:14PM -0700, Guenter Roeck wrote:
> On 7/13/22 13:23, Scott Cheloha wrote:
> > PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> > guest control of one or more virtual watchdog timers.  The timers have
> > millisecond granularity.  The guest is terminated when a timer
> > expires.
> > 
> > This patch adds a watchdog driver for these timers, "pseries-wdt".
> > 
> > pseries_wdt_probe() currently assumes the existence of only one
> > platform device and always assigns it watchdogNumber 1.  If we ever
> > expose more than one timer to userspace we will need to devise a way
> > to assign a distinct watchdogNumber to each platform device at device
> > registration time.
> > 
> > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter, Michael,

Which tree is taking this series?

watchdog-next or PPC development?

-Scott
