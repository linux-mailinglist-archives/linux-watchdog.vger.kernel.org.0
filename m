Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28D9952FA
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 03:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbfHTBKR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 21:10:17 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:4396 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728615AbfHTBKQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 21:10:16 -0400
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7K15vPR001345;
        Tue, 20 Aug 2019 01:09:50 GMT
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com [15.241.140.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 2ug6m2r3nn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Aug 2019 01:09:50 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3427.houston.hpe.com (Postfix) with ESMTP id 1F7FD5C;
        Tue, 20 Aug 2019 01:09:48 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (anatevka.americas.hpqcorp.net [10.34.81.61])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id C366548;
        Tue, 20 Aug 2019 01:09:46 +0000 (UTC)
Date:   Mon, 19 Aug 2019 19:09:46 -0600
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     Corey Minyard <cminyard@mvista.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Convert@minyard.net,
        the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
        to@minyard.net, standard@minyard.net, interface@minyard.net,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
Message-ID: <20190820010946.GF25435@anatevka.americas.hpqcorp.net>
Reply-To: Jerry.Hoemann@hpe.com
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org>
 <20190819224345.GB8869@roeck-us.net>
 <20190820002309.GI445@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820002309.GI445@minyard.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-19_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200007
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 07:23:09PM -0500, Corey Minyard wrote:
> On Mon, Aug 19, 2019 at 03:43:45PM -0700, Guenter Roeck wrote:
> > On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
> > > From: Corey Minyard <cminyard@mvista.com>
> > > 
> > > This is for the read data pretimeout governor.
> > > 
> > > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > 
> > On further thought, I think it would be a bad idea to add this
> > functionality: It changes the userspace ABI for accessing the watchdog
> > device. Today, when a watchdog device is opened, it does not provide
> > read data, it does not hang, and returns immediately. A "cat" from it
> > is an easy and quick means to test if a watchdog works.
> 
> Umm, why would a "cat" from a watchdog tell you if a watchdog works?

cat /dev/watchdog starts the watchdog running.

Then one can do useful things like monitor /sys/class/watchdog/watchdogN and see
time ticking down, etc..,

echo V > /dev/watchdog stops the watchdog assuming driver supports WDIOF_MAGICCLOSE.

So I can test without having to reboot.

One can't test magic close with the proposed change as /dev/watchdog
is exclusive open.




-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
