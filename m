Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 114841739BA
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2020 15:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgB1OYE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Feb 2020 09:24:04 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55408 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgB1OYE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Feb 2020 09:24:04 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SENh5g077109;
        Fri, 28 Feb 2020 08:23:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582899823;
        bh=EEILE+Fex4n/42JxlV2SbtmSLAQuNLKLGkMArgUzilk=;
        h=From:To:CC:Subject:Date;
        b=y3Iuy0NERZnwgCiULydlgmNtajn4TulIpbhihnoTF6em92j2Lqor/NrixcTv0YAV9
         r11bXEOSTgn45gKt3krlKG/i7MrTSj2IURazAOkF8DzQ/rj2RpTi8OTwQogdwZvKub
         07Y8KfqK4DIkx1LhYzEKnAhFN3rYrd/sEtstW7X8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SENh9F016625
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Feb 2020 08:23:43 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 08:23:43 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 08:23:43 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SENf3w049600;
        Fri, 28 Feb 2020 08:23:41 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] watchdog: add TI K3 SoC watchdog support
Date:   Fri, 28 Feb 2020 16:23:27 +0200
Message-ID: <20200228142331.13716-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

This series adds support for TI K3 SoC watchdog. This watchdog operates
in windowed mode, meaning if it is petted either too early or too late
compared to its time window, it will generate an error.

Patch #2 fixes a limitation in the watchdog core this causes, as
typically the keepalive timers pet watchdogs immediately when they are
started, and with the RTI watchdog, this causes an immediate reset (too
early petting of the watchdog timer.) Alternative approach to avoid this
would be to add timer within the K3 driver itself to ignore too early
petting when the watchdog is started. Feedback welcome how people want
to see this handled.

Patch #4 should be merged via the ARM SoC tree once driver side patches
are acceptable (I can handle this portion later on.)

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
