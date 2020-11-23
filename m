Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D442BFE19
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 03:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgKWCJH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 22 Nov 2020 21:09:07 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:59982 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726711AbgKWCJH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 22 Nov 2020 21:09:07 -0500
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AN22xTj032267;
        Mon, 23 Nov 2020 02:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : mime-version; s=pps0720;
 bh=QmfE6Ij+KMUhLcZONLYWnxLEH3a1rnm42vF1KrXJGeY=;
 b=ni61ff/PIjaSkVwvILSPj0qcMlA2Oc6XsL4OFjOKTa9ipZtD++yVTjmCwOWlpG/KHH1v
 jVzf+pYNy8K1WH13q8JMQYyjqt0SSjYptFjbXR5dQjhOZPLvql7JQB14dyjONMO1Fr7r
 nw9tjbyWE4vFsgTWz6f0qRusfzMkIp3Cq4NyvpPvivfbTHVa0h6H1rcDNAkzsg20Sn/w
 RV6NRlPpAzOMbpyIaSLRsTqTRzzJ3F7izSZVRBtoEzsYxi5uwMrvUTnxyc0YuFR4bfY3
 uezePPPrM38VlRjad9vyr2mfiZ6NNtCEIlyod43cHh5az67xe18Jw4KC5hCE/AhQunS2 2A== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com [15.241.140.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 34xsvn2b0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Nov 2020 02:08:52 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3427.houston.hpe.com (Postfix) with ESMTP id 085F55C;
        Mon, 23 Nov 2020 02:08:52 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 6BCCA4B;
        Mon, 23 Nov 2020 02:08:51 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     kasong@redhat.com, linux-watchdog@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH 0/2] watchdog/hpwdt: Disable Pretimeout/NMI in Crash Path
Date:   Sun, 22 Nov 2020 19:08:38 -0700
Message-Id: <1606097320-56762-1-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-22_16:2020-11-20,2020-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=597 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011230011
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

An intermittent issue was first noticed on RHEL 8.x during kdump.
When the dump completed and the system was in the process of resetting
an NMI would get generated as a result of an IO error.

For a discussion of the underlying cause and attempt to fix see:
	https://lkml.org/lkml/2019/12/25/159

The kernel's handling of the NMI generated an intermittent
secondary NMI that would hang the system.

As systemd enables WDT during shutdown, the WDT should have broken
the system out of the hang, but hpwdt_pretimeout stops the WDT
in order to allow the collection of a kdump.  But as we are
already in the crash kernel when the NMI is received, stopping 
the WDT is not necessary.

Jerry Hoemann (2):
  watchdog/hpwdt: Disable NMI in Crash Kernel
  watchdog/hpwdt: Reflect changes

 drivers/watchdog/hpwdt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
1.8.3.1

