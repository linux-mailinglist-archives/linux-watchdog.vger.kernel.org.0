Return-Path: <linux-watchdog+bounces-2130-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CCD99324B
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 17:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 275801C23493
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 15:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE001DA60D;
	Mon,  7 Oct 2024 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="IeN8f2L2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3CC1DA0E0;
	Mon,  7 Oct 2024 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728316694; cv=none; b=sDOUp/30cNoEVmAptx51ZZS3CyNt0vJaRV/D+88/y+P8CPiJeMElIXQt5Dkgoh96LI6yyl+LRfNxr9hMim8vXDNZF1cEsqZcXadeY8/C7taUfxzyvUAf1uErszhtEVitMrbMrKmNxPe7pkVS8KQqouJwsT+hn9ckU+Y4fBrXbZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728316694; c=relaxed/simple;
	bh=BoqOg2/3zHs1NXWmzV+CG2DI2MYPleJDLep1+J4Fons=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f19yuxgh7bgnH3z7FTE7hnVs53NeyjGhfe/fytwvo4sp1iSvZmse0Z+b8rqs0jiar4dw2FfIaoEVw6Nv4VY8vcqG3Es/jyjmn/HE3IQnMm7NxHhh8RRS0rsckElVpg3G7SrNe8r8mbdLYV2Fq0Od7OcaAwm3MpKkwnyqQkrxRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=IeN8f2L2; arc=none smtp.client-ip=173.37.86.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=249; q=dns/txt; s=iport;
  t=1728316693; x=1729526293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BoqOg2/3zHs1NXWmzV+CG2DI2MYPleJDLep1+J4Fons=;
  b=IeN8f2L2YjsErn7mY1mMzckXC/PQ3WB1YhkNP/LKE1z00llcOssnfupa
   as+r+QSs5a+RrjoWPz1C/vQKDOniGUoRj11+TOZfjd1ADjaRVWuR/mog1
   6w8MfENIZ0wNUwOsFHGuJO24kCnc1huAX7BQdW1RTVJ0iCWapHYTVWClE
   s=;
X-CSE-ConnectionGUID: eioXcUebSxqay6xPSMl9/Q==
X-CSE-MsgGUID: jNpo82l/S3Of2YdDcLsUDw==
X-IPAS-Result: =?us-ascii?q?A0A7AQCKAwRnl43/Ja1aHgEBCxIMggQLhBtClw+LcoxGh?=
 =?us-ascii?q?V6Bfg8BAQEPRAQBAYNzgRQCihcCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEFA?=
 =?us-ascii?q?QEFAQEBAgEHBRQBAQEBAQEBATcFSYYIhlwBAQECATIBRgULUVaDGoJCIwIBr?=
 =?us-ascii?q?XWCLIEB3jOBbBiBMIgxgQ2EBXCEdycbgUlEhH2FEIV3BIERkHeLaiWBIogli?=
 =?us-ascii?q?CeIaUiBIQNZIQIRAVUTDQoLCQWJNYIDgSMpgWuBCoMLhSWBZwlgiEqBBy2BE?=
 =?us-ascii?q?YEfOoICgTZKhUZHP4JLa045Ag0CN4IlgQiCVoVkQAMLGA1IESw1FBsGPm4Hs?=
 =?us-ascii?q?hemY6B9hCKEb5xNGjODcgGmVy6HY5Blo0luhGaBZzqBW3AVgyNRGQ+OOsYPI?=
 =?us-ascii?q?3ACBwsBAQMJhkiHQwEB?=
IronPort-Data: A9a23:800wF6K4xazUqug/FE+Rh5UlxSXFcZb7ZxGr2PjKsXjdYENSgzEHy
 2FJXmqHbP+JM2f3c9x/PY20oEME78eAm4MwTAQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcYZpCCWa/k79WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrU0
 T/Oi5eHYgP8g2Yrajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1jDUYGNrAV8N1nGGhfq
 +wgExUJP1e60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLo5m+yoi2PybxVTqUmeouw85G27IAlZiuWzaoCEJo3XLSlTtkS+v
 mWWpWC+OUo9OoauxRaO1mmRqvCayEsXX6pXTdVU7MVCn0aa7m8eEhsbUR28u/bRolG/XvpbK
 koJ6m8xpLQ59ECsQZ/6RRLQiHuFvRdaRNdLD+Ag4gyXxYLQ4gCEFi4FSCJMbJots8pebTgr0
 EKZt8nuCDds9aCOD3SQ6t+8rz+/PTYcN2IqfjIfQE0J7rHLpIA1kwKKTdt5FqOxpsP6FCu2w
 D2QqiU6wbIJgqYj06S94ECCnDuwrZjFSQEd+AraRCSm4xl/aYrjYJangWU39t5aJ4qfC13Et
 38elo3GsKYFDIqGk2qGR+Bl8KyVC+itPTzbsVVSEpMa5y2k6iCzRbt15GA5HRI8WiobQgMFc
 HM/qCsIu8UDZyPwMPIpC79dHfjG2kQJKDgcfqm8gi51SsEpLmevpXg2DWbJhjCFraTZufxmU
 XttWZ33Vihy5GUO5GfeetrxJpdxl3BjlD+NH82gp/lluJLHDEOopX4+GAPmRogEAGms+W05L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:LrCIna2a3k8Y7aoaJVt1XAqjBIkkLtp133Aq2lEZdPWaSKClfq
 eV7ZAmPHDP5gr5NEtLpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCEGgh1/qB/9SKIULDH4BmuJ
 uIWpIOb+EYdWIbsS4/izPIaurJB7K8gcaVuds=
X-Talos-CUID: 9a23:GC6Pamxt33wLkfIhPqwUBgUZG8cVeUDQxkzAOkapV3ZRc5iRGBiprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Acq2sfw/rZSGPo3EB+kWqL9CQf8VO+6P+UkRKqs4?=
 =?us-ascii?q?htZO1OQB7HyygoCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.11,184,1725321600"; 
   d="scan'208";a="256229495"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2024 15:57:05 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTP id 2A621180001B4;
	Mon,  7 Oct 2024 15:57:03 +0000 (GMT)
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: mika.westerberg@linux.intel.com
Cc: linux@roeck-us.net,
	jdelvare@suse.de,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	wim@linux-watchdog.org,
	wsa@kernel.org,
	xe-linux-external@cisco.com
Subject: [PATCH v3] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
Date: Mon,  7 Oct 2024 08:57:02 -0700
Message-Id: <20241007155702.3676667-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <05dba51b-7c3c-4455-9c97-09777e885fac@roeck-us.net>
References: <05dba51b-7c3c-4455-9c97-09777e885fac@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com

Hello Mika,

> I suggest adding some #define for the magical number 8 so that it is
> easier for anyone looking at this driver to figure out what it is doing.

Are the changes with #define NMI_NOW bit fine for you?

Best regards,
Oleksandr

