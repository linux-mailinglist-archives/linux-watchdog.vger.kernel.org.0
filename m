Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F0B223CC8
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jul 2020 15:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGQNbr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jul 2020 09:31:47 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:32854 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgGQNbq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jul 2020 09:31:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06HDU8oW114940;
        Fri, 17 Jul 2020 08:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594992608;
        bh=qCM8znfZPz/piClKJDf8jsL+G7KSK3+d3D1OjIb9JQ0=;
        h=From:To:CC:Subject:Date;
        b=TYybr5zZhxyf8FUdWQypLgmHLZcfbZYBYSW7qIZ3niT/4b1FNtmnxjmy8s+WcUOfe
         qHPOJxbhqIDrYWLHo7ztqcg4sK/jruRpGxgqJ9+DnBExFCskpCsnLUmVnfUIMBEGUK
         AR11DheXxq77+ofqEywyTh0IGzE7LgLsVIJuIJUU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06HDU8tJ078747
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Jul 2020 08:30:08 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 17
 Jul 2020 08:30:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 17 Jul 2020 08:30:07 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06HDU5Lb051528;
        Fri, 17 Jul 2020 08:30:06 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv4 0/4] watchdog: rti-wdt: attach to running timer
Date:   Fri, 17 Jul 2020 16:29:54 +0300
Message-ID: <20200717132958.14304-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

V4 of this series only fixes 32bit compile issue with patch #3. Appears
to be compiling now fine with ARM32 allmodconfig.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
