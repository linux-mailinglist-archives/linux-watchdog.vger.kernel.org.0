Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38EC1207279
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jun 2020 13:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390777AbgFXLrj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jun 2020 07:47:39 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39542 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388491AbgFXLrj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jun 2020 07:47:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjmMx091834;
        Wed, 24 Jun 2020 06:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592999148;
        bh=GdDYXEnLUp3xK095tSlGwb9jb3L8Np+OV0SWafxxFts=;
        h=From:To:CC:Subject:Date;
        b=hLDjAVrD/3W+5SK64apSNKcfX9nWGAYML4eiXpKWOpUVA8CkQalIPIRJaVbt8SrYx
         LwBwkN/cy6V06TTBwBFKHqxU4uPPkBc025ucb7VHAkb2RVuqgS3bwrmw7y7I46ZuxO
         9UZbDhdQc8zl8eKYbwt80f8Rk5+AlH7FgRz+H+UI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05OBjmeS026495
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jun 2020 06:45:48 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 06:45:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 06:45:48 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjkCL118804;
        Wed, 24 Jun 2020 06:45:46 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCH 0/2] watchdog: rti: adjust initial ping for attach
Date:   Wed, 24 Jun 2020 14:45:32 +0300
Message-ID: <20200624114534.1362-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

This series fixes attaching the RTI watchdog driver to an already
running timer; it can be started by boot loader for example. In this
case, we must read the current remaining timeout, and adjust the
min_hw_heartbeat based on that so that we don't attempt to either pet
the watchdog too early, or too late.

The reason for all this is because the K3 RTI watchdog runs in windowed
mode only, petting it either too early, or too late causes a watchdog
reset.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
