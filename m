Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB9937F1D2
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 06:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhEMEFf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 May 2021 00:05:35 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:11848 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229459AbhEMEFf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 May 2021 00:05:35 -0400
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14D43nPf010583;
        Thu, 13 May 2021 04:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=X3OiJ6M3N+KOpWTEYN/okV3yrUpwRre6jSg0m7DMcPY=;
 b=KT/6u8Xid6p88ScMYVsatlG99JuWDx9ngIftqTwbUKIY7MYpg5XSGNKyssb0UdTyRggZ
 KxOaqAtaXaTcVh3R2sO0akYcl+PiIqM29PNmtgQaacmZ/ItgPfc9qfBEe2Up+gbAWszA
 dWjTRw1wLGKPdxBqxixQkVluIR1WB3Y2XFAUGDTHveSXp2MfrpXJQt4vCVu2ezZGdwBs
 drXp/Nt3jn0IbZJXE0PoxTh4aUpCaJ6Bw5gyBJSX+TPQtbdSwrTSIWey1MT65F1kB6to
 jD/76Wvtc1Rb4VdAfA3BJrEyBxdAf+C7rHNSpZrPRU/lzzIIJIzL0+Ow7aEDEX9Sbi7e kw== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
        by mx0b-002e3701.pphosted.com with ESMTP id 38gpnptapb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 May 2021 04:04:09 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2352.austin.hpe.com (Postfix) with ESMTP id B6781A1;
        Thu, 13 May 2021 04:04:08 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id C36A236;
        Thu, 13 May 2021 04:04:07 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH V2] watchdog/hpwdt: New PCI IDs
Date:   Wed, 12 May 2021 22:03:31 -0600
Message-Id: <1620878612-24736-1-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-GUID: mDP9MicR2FKEIDzZWtLEE35qWWhcCdWE
X-Proofpoint-ORIG-GUID: mDP9MicR2FKEIDzZWtLEE35qWWhcCdWE
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-13_01:2021-05-12,2021-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=573 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105130028
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

patch p1
New hardware with new PCI ID info

Changes V2
----------
Included signature.


Jerry Hoemann (1):
  watchdog/hpwdt: New PCI IDs

 drivers/watchdog/hpwdt.c | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.3.1

