Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C87160CB6
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Feb 2020 09:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgBQIQl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Feb 2020 03:16:41 -0500
Received: from mail3.iservicesmail.com ([217.130.24.75]:34577 "EHLO
        mail3.iservicesmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgBQIQl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Feb 2020 03:16:41 -0500
IronPort-SDR: Y2cbL+w2WYY0unhVZDBxWy+fR6PK1fj5Zx7y6impTKpKsYvaEPlXDN/I/WDMf5y0cJrCHhJimH
 Czdi8T/cEyMQ==
IronPort-PHdr: =?us-ascii?q?9a23=3AG//NKRWI9ob/WTa1T6hEUyV6PqbV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYYx2Dt8tkgFKBZ4jH8fUM07OQ7/m8HzNdqs/Y7TgrS99laV?=
 =?us-ascii?q?wssY0uhQsuAcqIWwXQDcXBSGgEJvlET0Jv5HqhMEJYS47UblzWpWCuv3ZJQk?=
 =?us-ascii?q?2sfQV6Kf7oFYHMks+5y/69+4HJYwVPmTGxfa5+IA+5oAnMucQam4lvJ6Y+xh?=
 =?us-ascii?q?fUv3dFe/ldyH91K16Ugxvz6cC88YJ5/S9Nofwh7clAUav7f6Q8U7NVCSktPn?=
 =?us-ascii?q?426sP2qxTNVBOD6XQAXGoYlBpIGBXF4wrhXpjtqCv6t/Fy1zecMMbrUL07Qz?=
 =?us-ascii?q?Wi76NsSB/1lCcKMiMy/W/LhsBsiq9QvRSsrAF9zYHJeoGYLPRwcKPHfd0ERm?=
 =?us-ascii?q?RPQ8leWDBODI6nc4sCDfYOMfpEo4XhuVcDqwa1Cwm2BOPozz9FnmX40rMm0+?=
 =?us-ascii?q?s/CwHNwQwvH9UIsHTbsd74M78SUeevzKnU1zrOdO5W2TH86IjTbhAhu+uDUq?=
 =?us-ascii?q?9qfsbLyEkvCxrIg1ONooLmJzOYzvoBv3WZ4uZ6SO6ihXIrpxtvrjWg3MshhI?=
 =?us-ascii?q?nEi4QIwV7e7yp52pw6JdigRU5+Zt6rDYVfujmBN4tzXsMiW2ZouDsmyrEeuZ?=
 =?us-ascii?q?60YiwKyJM/yh7acfOHcoyI4gj9W+aVPTt1i2hpeKy4hxmv60egxOr8Vs+q31?=
 =?us-ascii?q?pQsCVFicHAtnEL1xPN9siKUuVx8lqj1DqVygze5P1ILVoqmafUMZIszL49mo?=
 =?us-ascii?q?IWsUvZHy/2nEv2jLWRdkUh4uWo8+PnYq/6ppCGLIJ0lwf+MqU1msyjG+Q3KB?=
 =?us-ascii?q?UBUHKB9eS9yL3v5Vf5T6lSjv0qjqnZt4jXJcAapq6/Hg9U3Z8v6hilADe6zN?=
 =?us-ascii?q?sYnWQILFVKeB+ckYjpNE/BIOriAfe8nVusijFryO7CPrH7BZXNNHfDw//deu?=
 =?us-ascii?q?N56khB2E8sxMxU555TBZkfL//pHEz8rtrVClk+KQPn+ev/DMRB0dYmVH6CGO?=
 =?us-ascii?q?emN6Xd+QuQ6/4iOfaLYoAVuzbmIfMN6PvnjHt/klgYK/qHx5wSPUi1Avl8a3?=
 =?us-ascii?q?qeZ3Wk1s8GC3sDlhc4Tff2klSOWHhSeyDhDOoH+jgnBdf+Xs/4TYe3jenZ0Q?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G9TQDOSkpelyMYgtllgkOBPgIBgUU?=
 =?us-ascii?q?QUiASjGOGa1QGcx+DQ4ZShRaBAIMzhgcTDIFbDQEBAQEBNQIEAQGEQIIEJDw?=
 =?us-ascii?q?CDQIDDQEBBgEBAQEBBQQBAQIQAQEBAQEIFgaFc4I7IoNwIA85SkwBDgGDV4J?=
 =?us-ascii?q?LAQEKKax1DQ0ChR6CSwQKgQiBGyOBNgMBAYwhGnmBB4EjIYIrCAGCAYJ/ARI?=
 =?us-ascii?q?BboJIglkEjVISIYlFmDSBaloElmuCOQEPiBaENwOCWg+BC4MdgwmBZ4RSgX+?=
 =?us-ascii?q?fZoQUV4Egc3EzGggwgW4agSBPGA2ON44rAkCBFxACT4tJgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2G9TQDOSkpelyMYgtllgkOBPgIBgUUQUiASjGOGa1QGc?=
 =?us-ascii?q?x+DQ4ZShRaBAIMzhgcTDIFbDQEBAQEBNQIEAQGEQIIEJDwCDQIDDQEBBgEBA?=
 =?us-ascii?q?QEBBQQBAQIQAQEBAQEIFgaFc4I7IoNwIA85SkwBDgGDV4JLAQEKKax1DQ0Ch?=
 =?us-ascii?q?R6CSwQKgQiBGyOBNgMBAYwhGnmBB4EjIYIrCAGCAYJ/ARIBboJIglkEjVISI?=
 =?us-ascii?q?YlFmDSBaloElmuCOQEPiBaENwOCWg+BC4MdgwmBZ4RSgX+fZoQUV4Egc3EzG?=
 =?us-ascii?q?ggwgW4agSBPGA2ON44rAkCBFxACT4tJgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,451,1574118000"; 
   d="scan'208";a="319488593"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 17 Feb 2020 09:16:38 +0100
Received: (qmail 3320 invoked from network); 17 Feb 2020 06:34:47 -0000
Received: from unknown (HELO 192.168.1.163) (mariapazos@[217.217.179.17])
          (envelope-sender <porta@unistrada.it>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-watchdog@vger.kernel.org>; 17 Feb 2020 06:34:47 -0000
Date:   Mon, 17 Feb 2020 07:34:38 +0100 (CET)
From:   Peter Wong <porta@unistrada.it>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-watchdog@vger.kernel.org
Message-ID: <22536428.420166.1581921287637.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Greetings,
Please check the attached email for a buisness proposal to explore.
Looking forward to hearing from you for more details.
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

