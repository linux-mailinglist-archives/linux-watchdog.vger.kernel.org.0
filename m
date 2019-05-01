Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D791036C
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 May 2019 02:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfEAAFx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Apr 2019 20:05:53 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:46134 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726123AbfEAAFx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Apr 2019 20:05:53 -0400
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3UNpHT4019474;
        Wed, 1 May 2019 00:05:14 GMT
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 2s6xgy0w8x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 May 2019 00:05:14 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id 9F41251;
        Wed,  1 May 2019 00:05:13 +0000 (UTC)
Received: from anatevka (anatevka.americas.hpqcorp.net [10.34.81.61])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 307A850;
        Wed,  1 May 2019 00:05:11 +0000 (UTC)
Date:   Tue, 30 Apr 2019 18:05:11 -0600
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        "martin@hundeboll.net" <martin@hundeboll.net>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: Re: [PATCH v9 0/3] watchdog: allow setting deadline for opening
 /dev/watchdogN
Message-ID: <20190501000511.GA25050@anatevka>
Reply-To: Jerry.Hoemann@hpe.com
References: <20190116121432.26732-1-rasmus.villemoes@prevas.dk>
 <20190121204527.5548-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121204527.5548-1-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-30_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300141
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 21, 2019 at 08:45:38PM +0000, Rasmus Villemoes wrote:
> If a watchdog driver tells the framework that the device is running,
> the framework takes care of feeding the watchdog until userspace opens
> the device. If the userspace application which is supposed to do that
> never comes up properly, the watchdog is fed indefinitely by the
> kernel. This can be especially problematic for embedded devices.
> 
> The existing handle_boot_enabled cmdline parameter/config option
> partially solves that, but that is only usable for the subset of
> hardware watchdogs that have (or can be configured by the bootloader
> to have) a timeout that is sufficient to make it realistic for
> userspace to come up. Many devices have timeouts of only a few
> seconds, or even less, making handle_boot_enabled insufficient.
> 
> These patches allow one to set a maximum time for which the kernel
> will feed the watchdog, thus ensuring that either userspace has come
> up, or the board gets reset. This allows fallback logic in the
> bootloader to attempt some recovery (for example, if an automatic
> update is in progress, it could roll back to the previous version).
> 

Rasmus,

Sorry if I missed it, but are you still looking into adding
this feature?  I was thinking it might also be useful with
kdump when a watchdog was running in the first kernel.

After a panic if kdump is configured, the system will boot the
crash kernel.  If a watchdog was running in the first kernel
it would still running in the crash kernel environment.

Some of the drivers on HPE systems take a non-trivial amount of time
to reset during the crash kernel boot, so it would be good to have
the core pet the watchdog until user space is ready.  But as the
crash kernel environment has its issues,  we really don't want
the core to ping the watchdog indefinitely.

Thanks

Jerry

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
