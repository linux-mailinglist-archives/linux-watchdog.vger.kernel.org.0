Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80AA0330C33
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 12:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhCHLWZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 06:22:25 -0500
Received: from smtp.asem.it ([151.1.184.197]:58542 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231958AbhCHLWH (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 06:22:07 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000850606.MSG 
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Mar 2021 12:21:56 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 8 Mar
 2021 12:21:55 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 8 Mar 2021 12:21:55 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1 0/2] Watchdog Core Global Parameters
Date:   Mon, 8 Mar 2021 12:21:49 +0100
Message-ID: <20210308112151.716315-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F1A.604608D3.007C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch series add a new way to consider the module parameters for the
watchdog module.

Instead of adding this kind of module parameters independently to each
driver, the best solution is declaring each feature only once,
in the watchdog core.

Additionally, I added a implementation example of this "global" parameters
using the module "wdat_wdt"

In details:

===============================
Watchdog Core Global Parameters
===============================

Information for watchdog kernel modules developers.

Introduction
============

Different watchdog modules frequently require the same type of parameters
(for example: *timeout*, *nowayout* feature, *start_enabled* to start the
watchdog on module insertion, etc.).
Instead of adding this kind of module parameters independently to each
driver, the best solution is declaring each feature only once,
in the watchdog core.

In this way, each driver can read these "global" parameters and then,
if needed, can implement them, according to the particular hw watchdog
characteristic.

Using this approach, it is possible reduce some duplicate code in the *new*
watchdog drivers and simplify the code maintenance.  Moreover, the code
will be clearer, since the same kind of parameters are often called
with different names (see Documentation/watchdog/watchdog-parameters.rst).
Obviously, for compatibility reasons, we cannot remove the already existing
parameters from the code of the various watchdog modules, but we can use
this "global" approach for the new watchdog drivers.


Global parameters declaration
==============================

The global parameters data structure is declared in
include/linux/watchdog.h, as::

	struct watchdog_global_parameters_struct {
		int timeout;
		int ioport;
		int irq;
		unsigned long features;
		/* Bit numbers for features flags */
		#define WDOG_GLOBAL_PARAM_VERBOSE	0
		#define WDOG_GLOBAL_PARAM_TEST_MODE	1
		#define WDOG_GLOBAL_PARAM_START_ENABLED	2
		#define WDOG_GLOBAL_PARAM_NOWAYOUT	3
	};

The variable "feature" is a bitwise flags container, to store boolean
features, such as:

* nowayout
* start_enable
* etc...

Other variables can be added, to store some numerical values and other data
required.

The global parameters are declared (as usual for the module parameters)
in the first part of drivers/watchdog/watchdog_core.c file.
The above global data structure is then managed by the function
*void global_parameters_init()*, in the same file.

Global parameters use
=====================

Each watchdog driver, to check if one of the global parameters is enabled,
can use the corresponding in-line function declared in
include/linux/watchdog.h.
At the moment the following functions are ready to use:

* watchdog_global_param_verbose_enabled()
* watchdog_global_param_test_mode_enabled()
* watchdog_global_param_start_enabled()
* watchdog_global_param_nowayout_enabled()



Flavio Suligoi (2):
  watchdog: add global watchdog kernel module parameters structure
  watchdog: wdat: add start_enable global parameter

 Documentation/watchdog/index.rst              |  1 +
 .../watchdog-core-global-parameters.rst       | 74 +++++++++++++++++++
 drivers/watchdog/watchdog_core.c              | 74 +++++++++++++++++++
 drivers/watchdog/wdat_wdt.c                   |  2 +
 include/linux/watchdog.h                      | 42 +++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/watchdog/watchdog-core-global-parameters.rst

-- 
2.25.1

