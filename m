Return-Path: <linux-watchdog+bounces-330-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EC8120EE
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 22:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C83FAB211E2
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 21:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F7F7FBB6;
	Wed, 13 Dec 2023 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="a2+006XK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B70BAC;
	Wed, 13 Dec 2023 13:54:08 -0800 (PST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDKbCiQ025993;
	Wed, 13 Dec 2023 21:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pps0720;
 bh=r+TUhhlxCI/DLNrETTUqEE6yD/vt372k5iKQotc3Yl4=;
 b=a2+006XKiRixF/RVLRzLNIlTBWeLn+1vXJ6DXAt3h9dPGEhmoVeOPWkzADV203gRT46k
 RVq/OFwBYF5En4X8j9qbjUB2079OrUYEbSciP48xW6djYE1c5fkSXL9+EMJ+F/B69c6E
 wGt4XBGkVjFQylLjZ7awiHHz0597Ekmx/VRFtDO54v30aEXFhr90+svL90O3QU4SJQtZ
 Ceh90i4/ic/F5NxeeKmf/BV+15SUI22SZ+TKcN0PLQEXpwAj/X3dhl73Bywfv9bTRBes
 94/XSle0v26mG1tGdypm1hnWMwFNnop3hW3a0g5L+sOuo7g0VE0G4Y/EFxq/C25xmUoc qA== 
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3uyfh82xt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:53:52 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id DD1BF805E0F;
	Wed, 13 Dec 2023 21:53:51 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id B1FCD8000B4;
	Wed, 13 Dec 2023 21:53:50 +0000 (UTC)
From: Jerry Hoemann <jerry.hoemann@hpe.com>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH v2 0/3] watchdog/hpwdt: Cleanup Claiming NMI
Date: Wed, 13 Dec 2023 14:53:37 -0700
Message-ID: <20231213215340.495734-1-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iyvfKdkmKXvtcNdv1TI-zV3B89qV7BQD
X-Proofpoint-GUID: iyvfKdkmKXvtcNdv1TI-zV3B89qV7BQD
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-13_14,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312130154

In addition to being a watchdog, hpwdt participates in error
containment on ProLiant systems.

On legacy platforms, Gen 9 and earlier, Fatal IO errors would be
signaled as an IO CHECK NMI with expectation that hpwdt would be present
to receive the NMI and crash the systems thus containing the error.

A problem was that hwpdt did not discriminate enough in accepting NMIs.
This could lead to problems if an NMI generated for another subsystem
was not claimed by that subsystem and became UNKNOWN and was claimed
by hpwdt.  Application profiling was such an example.  Although the known
profiling issue was fixed, hpwdt should avoid claiming NMI not intended
for it.

In iLO 5 time frame, checks were added to make hpwdt more selective
in claiming NMI.  This patchset cleans up the checks and enables them
for future versions of iLO.

Updates from V1
---------------
Refactor second patch into two creating a three patch series.
Update and clarify patch documentation.



Jerry Hoemann (3):
  watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO
  watchdog/hpwdt: Remove redundant test.
  watchdog/hpwdt: Remove unused variable

 drivers/watchdog/hpwdt.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

-- 
2.41.0


