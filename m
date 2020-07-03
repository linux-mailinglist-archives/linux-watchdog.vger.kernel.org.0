Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36082139BD
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jul 2020 14:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgGCMGY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jul 2020 08:06:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38592 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgGCMGX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063C4N5u060548;
        Fri, 3 Jul 2020 07:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593777863;
        bh=kdR2TJJBrcPf1Bc3eMzzp735S3G2O9rg5FASRsSjMMs=;
        h=From:To:CC:Subject:Date;
        b=QDWi2yLfIs2+9H9PoQPfOP/8l+3Pq9EMpyzB5K475nxv5viW96s+Pfh0d4dGWvu3k
         A+eBSEz68/hLkGLE6I6W/HJmQ63SZdQsRlZmQdgogKLBhBpyaIPiCQ6QlqBHO/LEF3
         uJ1w6B0XEzl0KLgkJs8LWCtl/qfBv9nTMlrhdB0c=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 063C4Hlx068709
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Jul 2020 07:04:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 07:04:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 07:04:17 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063C4Fke109800;
        Fri, 3 Jul 2020 07:04:16 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv2] watchdog: rti-wdt: support attaching to running wdt
Date:   Fri, 3 Jul 2020 15:04:01 +0300
Message-ID: <20200703120406.7092-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Version 2 of the series has quite a few changes based on feedback on
previous version.

1) Add new watchdog core API for adjusting the last hw keepalive time
   (Patch #2)
2) Modify the driver to support adjusting the window size, current
   driver only supports 50% window size. The window size is configured
   via a module parameter.
3) Modify the attach mechanism to running wdt to configure the heartbeat
   and window size based on running HW wdt setup.
4) Fix a runtime PM issue that was noticed while dealing with the new
   module parameter (tested via rmmod / modprobe)

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
