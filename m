Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604F84445AD
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Nov 2021 17:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbhKCQSL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Nov 2021 12:18:11 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com ([40.107.236.78]:27669
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232854AbhKCQSI (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Nov 2021 12:18:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpUwfH8bBZzPQ0/x0eagczHmyBXNv1a6lJFa8PRWCDmC3hoSZvsot6a3xLq0R3l5vx3icqU1N4kKSyqKh9+VslxqSMzXSrYWwd4j0hubM4/1kZnC6tgjSOniiR/phy4V5bkn2bATAHPYmwSeM2oL/L+EcUMdIuWZmwbA5fpYOd7680ZnN3lusi0s/1v7pPczH1tCQ7iSJXfFPux+/qajZTqtFoRVonp0q+sFQCriikDKawvRT/ocyJZRMh4UCm8uz/HIlby9Eaw46qye84dbWu/eXurETNOUEWUzInHg5Ix3uOzfP3IksFJrFrtH/PcnPlvATGltJKjQ9b4v3ROH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYQoXBx83YscAdALr7mf2Duf4tI3k6XzUacMVhvGjik=;
 b=nch/nNlTaVr/uvPY2XGwxd9THXCGS52UKQAoSFsvaMFEJ1qbodfER5lxb8EZpNle0XdsjMWSPNgu7U6rX00/kQkP/Rc+09ejfCobckuwEu4SODbTfyYmMedYDekHIUUugAomNCmo2hpQexMHyWuYKX4kw/ccnsAloKKO9Ep6w53dBQEalS6oQudRGbrxgUnXSQpjkSFaFFRqMlWMz25Jekdi/jPDcCEfQxsB2IWu9wNszM933LfpPTppy1zJkS/ZqvP74F1iHHp65xzorPYM2smfpUGSlkffs34jDodV9HyiyUG6yECxJNr8tOceDXV08fD6YJraLI5U3HF13pedpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYQoXBx83YscAdALr7mf2Duf4tI3k6XzUacMVhvGjik=;
 b=eMTrL3Cdj0An+yWbGjStGdmnTfxAhHZlZi1w3Q6AT/cog4huXBBPwX/3Mc/WQWKPOkVCabcWjXka6KhfoU2C5ZannOQqKwSk7MVWuBh2iMxToV6lHNi+Wy+51VqnjVZ4vs8t9WKmJ36NWzBKJ1xMpGQ24uaw9enrWm0tmX8TEII=
Received: from MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::29)
 by BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 16:15:29 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::e8) by MW4P221CA0024.outlook.office365.com
 (2603:10b6:303:8b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 16:15:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 16:15:29 +0000
Received: from ethanolxb27ehost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 11:15:28 -0500
From:   Terry Bowman <terry.bowman@amd.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <terry.bowman@amd.com>, <rrichter@amd.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <ssg.sos.patches@amd.com>,
        <sudheesh.mavila@amd.com>
Subject: [PATCH v2 0/4] Watchdog: sp5100_tco: Replace watchdog cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Wed, 3 Nov 2021 11:15:17 -0500
Message-ID: <20211103161521.43447-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d43ff801-9851-4505-ed92-08d99ee52751
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5179E34B70D2D860B0342B39838C9@BN9PR12MB5179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afuoRLFg7kXBFd+f5wKknO16SJonWjpSgCihjAQ4BE+MHwED+sXjK0wFDmYyaQLCsMMq8rqPZ6v1L/m0JN35rvvo1cpw6Cc282F3AvXoUadLIJ0uAD1vEHyeCiDuTa8DFAjl7BmdJmuWrF7361Y10ILP2f2j3Je3GXyzH8UEBQL8cM1YfNNDmAz8/VarJJ11yaCHgn8mYUQLZo2K53HvXL87teJ3ID2aNtfJXU7gIpZNK8bSquilPmzCT1QMd8lI1JHrZl8ivO4U/OoeZCj184S7jkH+WSKb9y8iJSaCiFm0Kwt47X+YdMWWO7egQO/ExyWUPApWrym+zbtA/R7WX36X5ROu5uOI5VlJXDOxHewJLmIjBlhVDPpxnx0e4q49GaLt3/kPRJ93Zjf+4OZl9AWge5r9KBznEQJ5Vb3ecYfMpA7phmyOR7aBkvqjqLzbTcFkijN2P67BftXp48fEhV7F71xPHV0Ui3MDSf//UJDD+8nS5dxXANQ0jySn5L0lIhUvFaz0UdXV9gq/RRzCXNek1/bTOEegxhC5RtwvV6V93M1+ITAba7wEikNH11VQSiNJ8rhEcvlnRMbDc3CS5nJCwxvm2u9BvWyndswDSdNJbKPQENGQPJXhB52CFw3mj0j4wA2YMXAl0G7XHc20+JLWNrHovd/t/iYa/4lxqJnQKavvumZVsWwjbDiHz4EuCD3nsk2I11UG+GrcymBbn+MsutXdMxoWMQJKUxRH5dWPseKxTcjYsfjwsTB+thG8Ao8mAUOYi3UbAkgcXa+ruQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(6916009)(54906003)(82310400003)(316002)(7696005)(4326008)(36860700001)(47076005)(36756003)(8676002)(81166007)(356005)(2906002)(8936002)(70206006)(70586007)(6666004)(336012)(86362001)(26005)(426003)(83380400001)(2616005)(1076003)(508600001)(186003)(16526019)(44832011)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 16:15:29.2276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43ff801-9851-4505-ed92-08d99ee52751
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5179
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use MMIO instead of cd6h/cd7h port I/O during EFCH watchdog initialization.
EFCH cd6h/cd7h PIO can be disabled and the recommended workaround is to use
MMIO. As a result MMIO will be used for EFCH SMBus controller address
discovery and starting the EFCH watchdog timer.

Update EFCH detection to support future AMD processors. This will support
new AMD processors without requiring driver modifications.

Patch details:

The first patch refactors watchdog timer initialization into a separate
function. This is needed for future patches. New functional changes are
not added.

The second patch splits out existing memory reservation and address
mapping into new functions. New functional changes are not added.

The third patch introduces EFCH initialization using MMIO. This is
required because cd6h/cd7h port I/O can be disabled on recent AMD hardware.

The fourth patch adds SMBus controller PCI ID check to enable EFCH MMIO
initialization. This eliminates the need for driver updates to support
future processors supporting the same EFCH functionality.

Testing:
Tested on AMD Fam17h and Fam19h processors using:
cat  >> /dev/watchdog

Terry Bowman (4):
  Watchdog: sp5100_tco: Move timer initialization into function
  Watchdog: sp5100_tco: Refactor MMIO base address initialization
  Watchdog: sp5100_tco: Add EFCH SMBus controller initialization using
    MMIO
  Watchdog: sp5100_tco: Enable Family 17h+ CPUs

 drivers/watchdog/sp5100_tco.c | 360 +++++++++++++++++++++++-----------
 drivers/watchdog/sp5100_tco.h |   6 +
 2 files changed, 251 insertions(+), 115 deletions(-)

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Richter <rrichter@amd.com>

Changes in V2:
   - Refactor into 4 patch series
   - Move MMIO reservation and mapping into helper functions
   - Combine mmio_addr and alternate mmio_addr base address discovery
   - Replace efch_use_mmio() with efch_mmio layout type
-- 
2.25.1

