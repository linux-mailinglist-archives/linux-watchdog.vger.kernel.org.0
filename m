Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F60C182CE0
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Mar 2020 10:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCLJ6t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Mar 2020 05:58:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42340 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJ6s (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Mar 2020 05:58:48 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02C9wRsh054691;
        Thu, 12 Mar 2020 04:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584007107;
        bh=iYZGpxc/4x16TGmIaej35oayuQv5bkMV+LQiaqr8PHY=;
        h=From:To:CC:Subject:Date;
        b=mP3iyMkYuIba96hg68IdIlsvvmTm8a0mKL1u+bYt+sIIwWoLDB+T+Zc1RARau78Hz
         WHayskJEQU5MEM3VV0YrfTfpI8tx/qUShVOlM6RuoPh84rLP+LrgIQNFsy38WKqmIZ
         FgZ9FCu6DlPnMrKzNiIPtuHjUfpfhk4H4ZWV/d1o=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02C9wR1e104200
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Mar 2020 04:58:27 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Mar 2020 04:58:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Mar 2020 04:58:26 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02C9wOR5089783;
        Thu, 12 Mar 2020 04:58:25 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCHv4 0/4] watchdog: add K3 RTI watchdog support
Date:   Thu, 12 Mar 2020 11:58:04 +0200
Message-ID: <20200312095808.19907-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

This addresses the comments from Rob against the DT binding doc, and
does the necessary changes to the driver code based on that (just
compatible name change on that side.) I retained Guenter's reviewed by
tag due to the very minor changes to the code.

Version jumps to v4 for all patches here, I happened to post v3 of patch
#3 before.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
